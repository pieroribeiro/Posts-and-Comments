var render = function(){
	var config 	= {
		tplPost 	: '<div class="post" data-id="[[ID]]"><h3>Post: [[TITLE]]</h3><br><h4>Post Date: [[DATE]]</h4><div class="comments"><h5>Comments:</h5></div></div>',
	};
	var renderPost = function(obj){
		return config.tplPost.replace('[[ID]]', obj.id).replace('[[TITLE]]', obj.title).replace('[[DATE]]', obj.date);
	};
	return {
		"renderPost" 	: renderPost
	}
}();