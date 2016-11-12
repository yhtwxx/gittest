(function($) {

    $.validator.addMethod('enlength', function(value, element, params) {
        var len = $.trim(value).replace(/[^\x00-\xff]/g, 'UB').length,
            range = params["range"],
            min = range.substring(range.indexOf('[') + 1, range.indexOf(',')),
            max = range.substring(range.indexOf(',') + 1, range.indexOf(']'));

        if (len >= min && max >= len) { return true; }
        return false;
    });

    $.validator.unobtrusive.adapters.add("enlength", ["range"], function(options) {
        options.rules["enlength"] = {
            range: options.params.range
        };
        options.messages["enlength"] = options.message;
    });

    /*
    $.validator.addMethod('grouprequired', function(value, element, params) {
        if (value.length == 0) { return true; }
        var group = params["group"], r = true;
        $("[data-val-grouprequired-group='" + group + "']").each(function(i, el) {
            if ($(el).val().length == 0) { r = false; return false; }
        });
        return r;
    });
    $.validator.unobtrusive.adapters.add("grouprequired", ["group"], function(options) {
        options.rules["grouprequired"] = { group: options.params.group };
        options.messages["grouprequired"] = options.message;
    });
    */

    $.validator.addMethod('notequal', function(value, element, params) {
        return value != params["vat"];
    });

    $.validator.unobtrusive.adapters.add("notequal", ["vat"], function(options) {
        options.rules["notequal"] = {
            vat: options.params.vat
        };
        options.messages["notequal"] = options.message;
    });

} (jQuery));