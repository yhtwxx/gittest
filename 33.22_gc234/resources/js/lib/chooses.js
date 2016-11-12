
    function Choose()
    {
        var choose = this;

        choose._odds = 0;
        choose._disabled = false;
    }

    Choose.prototype = {
        odds: function(odds)
        {
            var choose = this;

            if (typeof odds != 'undefined') {
                choose._odds = odds;
            }

            return choose._odds;
        },

        disable: function(bool)
        {
            var choose = this;

            if (typeof bool != 'undefined') {
                choose._disabled = !! bool;
            }

            return choose._disabled;
        }
    };

    var _class = function(){
        var chooses = this;
        chooses._init = false;
        chooses._data = {};
    };

    _class.EVENT_INIT = 'init';
    _class.EVENT_ODDS_CHANGE = 'odds_change';
    _class.EVENT_DISABLED_CHANGE = 'disabled_change';

    _class.prototype = {
        get: function(choose)
        {
            var chooses = this;

            chooses._data[choose] = chooses._data[choose] || new Choose();

            return chooses._data[choose];
        },

        isEnable: function(choose)
        {
            var chooses = this,
                item = chooses.get(choose);

            return item &&
                ! item.disable() &&
                is_effective_odds(item.odds());
        },

        odds: function(choose)
        {
            var chooses = this,
                item = chooses.get(choose);

            return item ?
                item.odds() :
                '0.00';
        },

        isInit: function() {
            var chooses = this;
            return !! chooses._init;
        },

        update: function(odds, disabled)
        {
            var chooses = this,
                diff_odds = {},
                diff_disabled = {};

            if (odds) {
                for (var choose in odds) {
                    if (odds.hasOwnProperty(choose)) {
                        var item = chooses.get(choose);

                        // origin != set
                        if (item.odds() != item.odds(format_odds(odds[choose]))) {
                            diff_odds[choose] = item.odds();
                        }
                    }
                }
            }

            if (disabled) {
                $.each(chooses._data, function(choose, item){
                    // origin != set
                    if (item.disable() != item.disable( !! disabled[choose])) {
                        diff_disabled[choose] = item.disable();
                    }
                });
            }

            if ( ! chooses.isInit()) {
                chooses.notice(null, _class.EVENT_INIT);
                chooses._init = true;
            } else {
                ! $.isEmptyObject(diff_odds) && chooses.notice(diff_odds, _class.EVENT_ODDS_CHANGE);
                ! $.isEmptyObject(diff_disabled) && chooses.notice(diff_disabled, _class.EVENT_DISABLED_CHANGE);
            }
        }
    };