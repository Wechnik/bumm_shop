<footer id="footer"><?php echo $text_footer; ?><br /><?php echo $text_version; ?></footer></div>
<script>
$(document).on('click','.note-insert button',function(){ 
	$('.modal-backdrop.in').css("display","none");
});
$(document).on('click','.note-link button',function(){ 
	$('.modal-backdrop.in').css("display","none");
});
</script>
</body></html>
