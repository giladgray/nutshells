module NutsHelper
	def rating(nut)
		"""
			<span class='label'>#{ nut.rating }</span>
			<div class='btn-group btn-group-vertical'>
				#{ link_to raw('<i class=\'icon-arrow-up\'></i>'), nuts_up_path(nut), remote: true, class: 'btn btn-mini' }
				#{ link_to raw('<i class=\'icon-arrow-down\'></i>'), nuts_down_path(nut), remote: true, class: 'btn btn-mini' }
			</div>
		"""
	end
end
