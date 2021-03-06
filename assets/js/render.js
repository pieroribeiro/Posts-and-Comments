var render = function(){
	var config 	= {
		tplPost 	: '<div class="post" data-id="[[ID]]"><h3>Post: [[TITLE]]</h3><br><h4>Post Date: [[DATE]]</h4><h5>Comments:</h5><div class="comments"></div></div>',
		tplComment 	: '<div class="comment" data-id="[[COMMENT_ID]]"><span>ID: [[COMMENT_ID]]</span><br><span>Comment: [[COMMENT]]</span><br><span>User: [[COMMENT_USER]]</span><br><span>Date: [[COMMENT_DATE]]</span><div class="actions"><i class="glyphicon glyphicon-remove comment-remove" data-id="[[COMMENT_ID]]" data-idpost="[[POST_ID]]"></a></div></div>'
	};
	var renderPost = function(obj){
		return config.tplPost.replace('[[ID]]', obj.id).replace('[[TITLE]]', obj.title).replace('[[DATE]]', obj.date);
	};
	var renderComment = function(objComment, _postId){
		return config.tplComment.replace(/\[\[COMMENT_ID\]\]/g, objComment.id).replace('[[COMMENT_USER]]', objComment.user).replace('[[COMMENT]]', objComment.comment).replace('[[COMMENT_DATE]]', objComment.date).replace('[[POST_ID]]', _postId);
	}
	return {
		"renderPost" 	: renderPost,
		"renderComment"	: renderComment
	}
}();