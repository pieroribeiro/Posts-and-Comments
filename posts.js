var posts = function(){
	var config 				= {
		urlReq_Posts 			: 'posts.txt',
		urlReq_Comments 		: 'comments.txt',
		urlReq_DeleteComment	: 'comment-delete.asp'
	};
	var request = function(_url, _callback){
		$.getJSON(_url, function(data){
			_callback(data);
		});
	};
	var listPosts = function(_callback){
		request(config.urlReq_Posts, function(data){
			_callback(data);
		});
	};
	var listCommentsByPost = function(idPost, _callback){
		request(config.urlReq_Comments +'?id='+ idPost, function(data){
			_callback(data);
		});
	};
	var removeComment = function(_id, _idPost, _callback){
		request(`${config.urlReq_DeleteComment}?id=${_id}&idpost=${_idPost}`, function(data){
			_callback(data);
		});
	};

	return {
		"listPosts" 	: listPosts,
		"listComments" 	: listCommentsByPost,
		"removeComment"	: removeComment
	}
}();