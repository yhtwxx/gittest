/**
 * Created by Timi on 2015/9/25.
 */
$(function() {
    /*var promotion = function(el, multiple) {
        this.el = el || {};
        this.multiple = multiple || false;

        // Variables privadas
        var links = this.el.find('.link');
        // Evento
        links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
    }

    promotion.prototype.dropdown = function(e) {
        var $el = e.data.el;
        $this = $(this),
            $next = $this.next();

        $next.slideToggle();
        $this.parent().toggleClass('open');

        if (!e.data.multiple) {
            $el.find('.submenu').not($next).slideUp().parent().removeClass('open');
        };
    }

    var promotion = new promotion($('#promotion'), false);*/
    
    	$(document).on("click", ".link", function(){
    		$this = $(this),
            $next = $this.next();

	        $next.slideToggle();
	        $this.parent().toggleClass('open');
	
	        
    	});
    
    
});