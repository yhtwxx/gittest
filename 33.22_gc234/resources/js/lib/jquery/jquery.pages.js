
(function(factory){
    if (typeof define === 'function' && define.amd) {
        define(['jquery'], factory);
    } else {
        factory(jQuery);
    }
})(function($){ 'use strict';
    $.fn.extend({
        pages: function(options){
            var $$ = this,
                data_index = 'tabs_data';

            // 很隨便的設定法
            ! $$.data(data_index) && $$.data(data_index, $.extend({
                init: false,
                tabs: {},
                views: {}
            }, typeof options == 'object' ? options : {}));

            var args = arguments,
                opt = $$.data(data_index),
                tabs = opt.tabs,
                tabs_view = opt.views,
                eachTabs = function(callback){
                    if (typeof callback == 'function') {
                        $.each(tabs, function(key, tab){
                            var view = tabs_view[key];
                            return callback(key, tab, view);
                        });
                    }

                    return $$;
                },
                focus = function(target) {
                    target && tabs[target] && tabs[target].click() || eachTabs(function(key, tab, view){
                        tab.click();
                        return false;
                    });

                    return $$;
                };

            if (opt.init) {
                if (typeof options == 'string') {
                    switch (options) {
                        case 'eachTabs':
                            return eachTabs(args[1]);
                        case 'focus':
                            return focus(args[1]);
                        default:
                            return $$;
                    }
                }
            } else {
                opt.init = true;

                $$.addClass('tabs-box').
                    find('[tabs-view]').each(function(){
                        tabs_view[this.getAttribute('tabs-view')] = $(this).addClass('tabs-view');
                    });

                $$.find('[tabs]').
                    each(function(){
                        tabs[this.getAttribute('tabs')] = $(this).addClass('tabs-btn');
                    }).
                    bind('click', function(){
                        var node = this,
                            active = node.getAttribute('tabs'),
                            pre =  $$.data('tabs-active');

                        $$.data('tabs-active', active);

                        eachTabs(function(key, tab, view){
                            if (key == active) {
                                tab.addClass('active');
                                view.
                                    addClass('active').
                                    show();
                            } else {
                                tab.removeClass('active');
                                view.
                                    removeClass('active').
                                    hide();
                            }
                        });

                        opt.onchange &&
                        typeof options.onchange == 'function' &&
                        options.onchange.call($$, tabs[active], tabs_view[active], tabs_view[pre]);
                    });

                focus(opt.current);
            }

            return $$;
        }
    });
});
