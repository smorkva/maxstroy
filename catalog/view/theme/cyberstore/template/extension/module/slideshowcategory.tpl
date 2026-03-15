<?php if($config_banners_categorys) { ?>
	<div id="banner-image-row-<?php echo $module_row;?>" class="carousel-container owl-carousel banner-category-img">
	<?php foreach($config_banners_categorys as $result) { ?>
		<div class="item">
			<?php if ($result['link']) { ?>
				<a href="<?php echo $result['link']; ?>">
					<img src="<?php echo $result['thumb'][$language_id]; ?>" alt="<?php echo $result['description'][$language_id]; ?>" class="img-responsive" />
				</a>
			<?php } else { ?>				
				<img src="<?php echo $result['thumb'][$language_id]; ?>" alt="<?php echo $result['description'][$language_id]; ?>" class="img-responsive" />				
			<?php } ?>
		</div>
	<?php } ?>
	</div>
<script><!--
var count_img = $("#banner-image-row-<?php echo $module_row;?> div.item").length;
if(count_img > 1) {
    $(document).ready(function() {     
      var time = 7; 
      var $progressBar,
          $bar1, 
          $bar, 
          $elem, 
          isPause, 
          tick,
          percentTime;
		  
        $("#banner-image-row-<?php echo $module_row;?>").owlCarousel({
			slideSpeed : 500,
			paginationSpeed : 500,
			navigation: true,
			navigationText: ['<span class="slideshow-btn-prev"></span>', '<span class="slideshow-btn-next"></span>'],
			pagination: true,
			singleItem : true,
			afterInit : progressBar,
			afterMove : moved,
			transitionStyle: 'fadeUp',
			startDragging : pauseOnDragging
        });
		
        function progressBar(elem){
          $elem = elem; 
          buildProgressBar();        
          start();
        }
		
        function buildProgressBar(){
			
			  $progressBar = $("<div>",{
				id:"progressBar"
			  });
			  $bar = $("<div>",{
				id:"bar"
			  });
			  $progressBar.append($bar).prependTo($elem)
			
        }
     
        function start() {
          percentTime = 0;
          isPause = false;      
          tick = setInterval(interval, 10);
        };
     
        function interval() {
          if(isPause === false){
            percentTime += 1 / time;
            $bar.css({
               width: percentTime+"%"
             });
            
            if(percentTime >= 100){              
              $elem.trigger('owl.next')
            }
          }
        }

        
        function pauseOnDragging(){
          isPause = true;
        }
     
   
        function moved(){
         
          clearTimeout(tick);
          
          start();
        }
         $elem.on('mouseover',function(){
           isPause = true;
         })
         $elem.on('mouseout',function(){
           isPause = false;
         })
     
    });

} else {
	$("#banner-image-row-<?php echo $module_row;?>").removeClass('owl-carousel');
}
--></script>		
<?php } ?>