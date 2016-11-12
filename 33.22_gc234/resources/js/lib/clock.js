
(function(factory){
    var id = 'Clock';
    if (typeof define === 'function' && define.amd) {
        define(id, ['observable', 'singleton', 'configuration'], factory);
    } else {
        self[id] = factory(observable, singleton, configuration);
    }
})(function(observable, singleton, configuration){ 'use strict';
    var timer;//單位秒

    function pad_left()
    {
        return this.toString().replace(/^(\d)$/, '0$1');
    }

    function date_format(date, format)
    {
        var retval = format || 'H:i:s';
        if(date instanceof Date){

            retval = retval
                .replace(/Y/g, date.getFullYear())
                .replace(/m/g, pad_left.call(date.getMonth()+1))
                .replace(/j/g, pad_left.call(date.getDate()))
                .replace(/H/g, pad_left.call(date.getHours()))
                .replace(/i/g, pad_left.call(date.getMinutes()))
                .replace(/s/g, pad_left.call(date.getSeconds()))
            ;
        }

        return retval;
    }
    
    function Clock()
    {
        if ( ! singleton.call(this, Clock, arguments)) {
            return Clock.instance();
        }

        var clock = this,
            date = new Date;

        observable.call(clock);
        configuration.call(clock, {
            format: 'Y-m-j H:i:s',
            $items: null,
            date: date,
            timezone_offset: date.getTimezoneOffset()
        });

        clock.render(date);
        timer = setInterval(function(){
            date.setTime(clock.getTime() * 1000 + 1000);
            clock.render(date);
            clock.notice(date.getTime() / 1000);
        }, 1000);

        return clock;
    }

    var _class = Clock;

    _class.prototype = {

        format: function(format)
        {
            var clock = this;

            clock.set('format', format);

            return clock;
        },

        //單位秒
        setTime: function(timestamp, timezone_offset)
        {
            var clock = this;

            (typeof timestamp != 'undefined') &&
            clock.get('date').setTime(timestamp * 1000);

            (typeof timezone_offset != 'undefined') &&
            clock.set('timezone_offset', timezone_offset);
            
            return clock;
        },

        //單位秒
        getTime: function()
        {
            var clock = this,
                date = clock.get('date');

            return date.getTime()/1000;
        },

        bind: function($items)
        {
            var clock = this;

            clock.set('$items', $items);

            return clock;
        },

        render: function(date)
        {
            var clock = this,
                $items = clock.get('$items');

            date = (date instanceof Date) ? date : clock.get('date');

            var _d = new Date(date.getTime() +
                (date.getTimezoneOffset() * 60000) -
                (clock.get('timezone_offset') * 60000));

            $items && $items.text && $items.text(date_format(_d, clock.get('format')));
        }
    };

    return _class;
});
