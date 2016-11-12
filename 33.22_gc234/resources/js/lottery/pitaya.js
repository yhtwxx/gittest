//pitaya業務核心
(function(ns){ 'use strict';
    var data = {},
        hasOwn = ({}).hasOwnProperty;

    var Pitaya = {
        casino_logo: function()
        {
            if (typeof this.casino_logo.img === 'undefined') {
                var img = '';
                if ('portal' === ns.document.body.id) {
                    img = decodeURIComponent($.cookie('casino_url') + $.cookie('casino_logo'));
                }
                //domain有可能有中文字
                if ( ! img.match(/^https?:\/\/.+(?:\..+)*(?:\/[-\w]+)*\w+\.png$/)) {
                    img = false;
                }
                this.casino_logo.img = img;
            }

            return this.casino_logo.img;
        },
        extend: function(target)
        {
            for (var i = 1, L = arguments.length; i < L; ++i) {
                var o = arguments[i];
                for (var prop in o) {
                    if (hasOwn.call(o, prop)) {
                        target[prop] = o[prop];
                    }
                }
            }

            return target;
        },

        update: function(source)
        {
            var pitaya = this;
            if (source instanceof Object) {
                pitaya.extend(data, source);
            }

            return pitaya;
        },

        prop: function(key, value)
        {
            var pitaya = this;
            if (typeof key == 'undefined') {
                return pitaya.extend({}, data);
            } else if (typeof value == 'undefined') {
                return data[key];
            }

            data[key] = value;

            return this;
        },
        format_odds: function(odds)
        {
            odds = (parseFloat(odds) || 0).toFixed(4);
            return odds.toString().replace(/^(\d+(?:\.\d{2}))\d*$/, '$1');
        },
        format_gold: function(gold)
        {
            return this.format_odds(gold);
        },
        filter_gold: function(gold)
        {
            return ((gold = parseInt(gold, 10)) && 0 < gold) ? gold : '';
        },
        isEffectiveOdds: function(odds)
        {
            return 1 <= parseFloat(odds);
        }
    };

    // 子母視窗溝通
    var child_windows = {
        'multiorder': null
    };
    Pitaya.bind = function(w)
    {
        if (w && ns.name && w.name != ns.name && w.Pitaya) {
            w.Pitaya.window(self);
        }
    };
    Pitaya.window = function(w)
    {
        var type = typeof w;

        switch (type) {
            case 'string'://取得單一視窗
                return child_windows[w] || window.open('', w);
            case 'object'://設定子視窗
                if (w.name && w.close) {
                    child_windows[w.name] = w;
                    return w;
                }
        }

        //未知操作
        return false;
    };

    Pitaya.windows = function()
    {
        for (var n in child_windows) {
            if (hasOwn.call(child_windows, n)) {
                if ( ! child_windows[n]) {
                    child_windows[n] = Pitaya.window(n);
                }
            }
        }

        return child_windows;
    };
    // 鍊結關閉視窗
    // 關閉自己(僅在自己是被其他視窗打開時)與所有視窗子
    Pitaya.closeWindows = function()
    {
        Pitaya.closeChild();
        if (self.opener) {
            self.close();
        }
    };
    Pitaya.closeChild = function(n)
    {
        if (typeof n == 'string') {
            var w = Pitaya.window(n);
            try {
                if (w && w.close) {
                    w.close();
                    return true;
                }
            } catch (e) {
                //SandBox
            }

            return false;
        }

        var closed = [];

        for (var n in child_windows) {
            Pitaya.closeChild(n) && closed.push(n);
            child_windows[n] = null;
        }

        return closed;
    };
    Pitaya.goto = function(url, target, params)
    {
        target = target || '_main';//預設操作主視窗

        var w;
        switch (target) {
            case '_blank'://禁止無止盡另開
                throw new Error('don\'t support _blank');
            case '_self':
            case '_top':
            case '_parent'://模仿原生target行為
                w = self[target.replace(/^_/, '')];
                break;
            case '_main'://主視窗
                w = self.opener;
                break;
            default://子視窗 (另開/獨體)
                var arr_params = [], str_params;
                params = params || {
                    menubar: 0,
                    scrollbars: 1,
                    width: 1024,
                    resizable: 1//IE only
                };
                for (var n in params) {
                    arr_params.push(n + '=' + params[n]);
                }
                str_params = arr_params.join(',');

                if ( ! (w = self.open('', target, str_params))) {
                    self.open(url, target, str_params);
                    return;
                }
        }

        try {
            if (w && w.location) {
                if (w.location.pathname != url) {
                    w.location.href = url;
                }
            }
        } catch (e) {
            //SandBox
        }

    };

    (function(){
        //由於fuel無法精準判斷 http / https
        var scripts, re, src;
        scripts = document.getElementsByTagName('script');
        re = /pitaya\.js/;
        for (var i = 0, leng = scripts.length; i < leng; i++) {
            if (re.test(scripts[i].src)) {
                src = scripts[i].src;
                break;
            }
        }
        // 註冊根目錄
        Pitaya.prop('root', src.replace(/\/assets\/.+$/, ''));

        // 註冊是否為測試模式
        var location = self.location;
        Pitaya.prop('is_debug', !! location.href.match(/debug/) || (location.hash && location.hash.match(/debug/)));

        var debug_node = self.document.createElement('span');
        debug_node.style.cssText = '\
            position: fixed;\
            top: 0;\
            right: 0;\
            background: #C00;\
            color: #FFF;\
            padding: 3px;\
            font-size: 12px;\
            display: none;\
            border-radius: 3px;\
            box-shadow: 0px 0px 3px #055;\
            z-index: 20001;\
        ';

        Pitaya.dump = function(msg){
            debug_node.innerHTML = msg && msg.replace(/</g, '&lt;').replace(/>/g, '&gt;');
        };

        // 除錯模式才顯示
        if (Pitaya.prop('is_debug')) {
            debug_node.style.display = '';
            self.document.body.appendChild(debug_node);
        }

        // trace 追蹤輸出 (for IE 8)
        // 不可用 console.log.apply
        Pitaya.trace = function(target, tab){
            if ( ! self.console || ! this.prop('is_debug')) {
                return;
            }

            (typeof tab == 'undefined') && (tab = '');

            if (typeof target != 'object' ||
                ! target ||
                typeof target.hasOwnProperty != 'function') {
                console.log(tab, target);
            } else {
                console.log(tab, '[Object]');

                for (var n in target) {
                    if (hasOwn.call(target, n)) {
                        console.log(tab, n, '=');
                        Pitaya.trace(target[n], tab + ' ');
                    }
                }
            }
        };

        document.oncontextmenu = function () {
            return Pitaya.prop('is_debug');
        };

    })();

    ns.Pitaya = Pitaya;

})(self);