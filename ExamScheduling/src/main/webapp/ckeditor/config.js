/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	
	config.uiColor = '#AADC6E';
	config.height = 400;

	
	config.filebrowserBrowseUrl ='../ckfinder/ckfinder.html';
	config.filebrowserImageBrowseUrl ='../ckfinder/ckfinder.html?Type=Images';
	config.filebrowserFlashBrowseUrl ='../ckfinder/ckfinder.html?Type=Flash'; 
	config.filebrowserUploadUrl ='../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files';
	config.filebrowserImageUploadUrl ='../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images';
	config.filebrowserFlashUploadUrl ='../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash';
	
	
	config.allowedContent=true;
	config.toolbar = 'xxxx';
	config.toolbar_Basic =
		 [
		    [ 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink' ],
		    [ 'FontSize', 'TextColor', 'BGColor' ],
		    '/',
		    ['ShowBlock','Source']
		 ]; 
		 
	config.toolbar_Full =
		 [
		  { name: 'document', items : [ 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates' ] },
		  { name: 'clipboard', items : [ 'Cut','Copy','Paste','-','Undo','Redo' ] },
		  { name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
		  { name: 'forms', items : [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton',
		   'HiddenField' ] },
		  '/',
		  { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
		  { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv',
		  '-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
		  { name: 'links', items : [ 'Link','Unlink','Anchor' ] },
		  { name: 'insert', items : [ 'Image','Table','HorizontalRule','Smiley','SpecialChar','PageBreak','Iframe' ] },
		  '/',
		  { name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },
		  { name: 'colors', items : [ 'TextColor','BGColor' ] },//文字顏色，背景顏色
		  { name: 'tools', items : [ 'Maximize', 'ShowBlocks','-','About' ] }//最大化，顯示區塊，關於ckeditor
		 ];
	
	config.toolbar_xxxx =
		 [		  
		  { name: 'styles', items : [ 'Font','FontSize' ] },
		  { name: 'colors', items : [ 'TextColor','BGColor' ] },
		  { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript' ] },
		  { name: 'links', items : [ 'Link','Unlink' ] },
		  '/',
		  { name: 'insert', items : [ 'Image','Table','HorizontalRule','Smiley','SpecialChar','PageBreak' ] },		  
		  { name: 'clipboard', items : [ 'Cut','Copy','Paste','-','Undo','Redo' ] },
		  { name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','SpellChecker' ] },		  		  
		  { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-' ] },
		  { name: 'document', items : [ 'Source','-','Print' ] }
		 ]; 
		
};



