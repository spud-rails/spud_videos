//= require_self
//= require_tree .
Spud = (typeof(Spud) == 'undefined') ? {} : Spud;
Spud.Admin = (typeof(Spud.Admin) == 'undefined') ? {} : Spud.Admin;

Spud.Admin.Videos = new function() {
	var self=this;
	self.init = function() {
		$('#video_list').sortable({axis:'y',
			update: self.videoOrderChanged
		});
	}
	self.videoOrderChanged = function(event, ui) {
		var arr = $('#video_list').sortable('toArray');
		// console.log(arr)
		ids = [];
		for(var cnt = 0;cnt < arr.length;cnt++)
		{
			ids.push(parseInt(arr[cnt].replace("video_",""),10));
		}
		
		// console.log(ids)
		jQuery.ajax("/spud/admin/videos/reorder?order=" + ids.join(","));
	}
};