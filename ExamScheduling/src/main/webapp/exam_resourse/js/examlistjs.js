



function deleteExam(examno){
	swal({
		  title: '確定要刪除?',
		  text: "無法復原",
		  type: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '刪除'
		}).then(function(isConfirm) {
		  if (isConfirm) {
			  $.post( "ExamList", { "examno": examno } );
	        	$("#"+examno).remove();
		    swal(
		      '刪除成功',
		      'Your file has been deleted.',
		      'success'
		    );
		 
		  }
		})
	
}