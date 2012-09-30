module NutsHelper
	def rating(nut)
		"""
			<span class='label'>#{ nut.rating }</span>
			<div class='btn-group btn-group-vertical'>
				#{ link_to raw('<i class=\'icon-arrow-up\'></i>'), up_nut_path(nut), remote: true, class: 'btn btn-mini' }
				#{ link_to raw('<i class=\'icon-arrow-down\'></i>'), down_nut_path(nut), remote: true, class: 'btn btn-mini' }
			</div>
		"""
	end
end
