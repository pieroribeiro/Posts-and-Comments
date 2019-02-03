$(document).ready(function(){
	var loadComments_interval = 5000;
	posts.listPosts(function(_posts){
		if(_posts){
			$.each(_posts,function(i, itemPost){
				$('.posts').append(render.renderPost(itemPost));
				posts.listComments(itemPost.id, 0, function(_comments){
					if(_comments){
						$.each(_comments, function(a, itemComment){
							$(`.posts .post[data-id="${itemPost.id}"] .comments`).append(render.renderComment(itemComment, itemPost.id));
							if(a >= _comments.length - 1){
								setInterval(function(){
									loadMoreComments(itemPost.id);
								}, loadComments_interval);								
							}
						});
					}else{
						$(`.posts .post[data-id="${itemPost.id}"] .comments`).append(`<span>There is no comments</span>`);
						setInterval(function(){
							loadMoreComments(itemPost.id);
						}, loadComments_interval);
					}
				});
			});

			// COMMENTS ACTIONS
			$('.posts').on('click', 'i.comment-remove', function(e){
				e.stopPropagation();
				e.preventDefault();
				var obj = $(this);
				posts.removeComment(obj.attr('data-id'), $(this).attr('data-idpost'), function(_dataRemove){
					if(_dataRemove){
						if(confirm('Do you want delete this comment?')){
							$(`.posts .post[data-id="${obj.attr('data-idpost')}"] .comments .comment[data-id="${obj.attr('data-id')}"]`).slideUp('slow', function(){
								$(this).remove();
								alert(`Comment ${_dataRemove.id} ${_dataRemove.action} at ${_dataRemove.date}`);
								if( $(`.posts .post[data-id="${obj.attr('data-idpost')}"] .comments .comment`).length <= 0 ){
									$(`.posts .post[data-id="${obj.attr('data-idpost')}"] .comments`).append(`<span>There is no comments</span>`);
								}
							});	
						}
					}
				});
			});
		}else{
			$('.posts').append(`<span>There is no posts</span>`);
		}
	});

	var loadMoreComments = function(_idPost){
		var tmp_id = 0;
		var _commentsObj = $(`.posts .post[data-id="${_idPost}"] .comments .comment`);
		if(_commentsObj){
			tmp_id = _commentsObj.first().attr('data-id');
		}else{
			tmp_id = 0;
		}

		posts.listComments(_idPost, tmp_id, function(_comments){
			if(_comments){
				$.each(_comments, function(i, itemComment){ 
					$(`.posts .post[data-id="${_idPost}"] .comments`).append(render.renderComment(itemComment, _idPost));
					$(`.posts .post[data-id="${_idPost}"] .comments .comment`).first().remove();
				});
			}
		});
	};
});