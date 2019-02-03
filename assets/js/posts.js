var posts = function(){
	var config 				= {
		urlReq_Posts 			: 'services/posts/list.asp',
		urlReq_Comments 		: 'services/comments/list.asp',
		urlReq_DeleteComment	: 'services/comments/delete.asp'
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
	var listCommentsByPost = function(_idPost, _idlastcomment, _callback){
		request(config.urlReq_Comments +'?idpost='+ _idPost +'&idlastcomment='+ _idlastcomment, function(data){
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