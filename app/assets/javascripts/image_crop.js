/* Avatar Panel control js functions */

var aspectRatio='1:1'; // ratio of the image
var x1=60; // x1 for the image selection start
var y1=60; // y1 for the image selection start
var x2=240; // x2 for the image selection start
var y2=240; // y2 for the image selection start
var selectionWidth=180; // width for the image selection start
var selectionHeight=180; // height for the image selection start
var maxWidth=300; // max width for the image selection
var maxHeight=300; // max height for the image selection
var minHeight=180; // min height for the image selection
var minWidth=180; // min width for the image selection
var sizefactor=3; // factor for the real size of the uploaded image
var bigWidthPrev=130; //
var bigHeightPrev=130;
var selWidth=0;
var selHeight=0;

function loadAndPreviewAvatar(input){
  if (input.files && input.files[0]) {


    var reader = new FileReader();
    reader.onload = function(e) {
      var img_id = 'big';
      var img = e.target.result;

      $('#uploaded_big').attr('src', img);
      //$('#uploaded_preview').attr('src', e.target.result);

      // set the preview image
      $('#preview').css({width:selectionWidth+"px",height:selectionHeight+"px"}).show();
      $('#preview').html('<img src="'+img+'" width="'+bigWidthPrev+'" height="'+bigHeightPrev+'" />');
      $('#preview img').css({'left':'-'+x1+'px','top':'-'+y1+'px'});

      // set selection image
      //$('#uploaded_div').html('<img id="'+img_id+'" src="'+img+'" width="'+maxWidth+'" height="'+maxHeight+'" />');

    }
    reader.readAsDataURL(input.files[0]);

      $('#uploaded_big').imgAreaSelect({
        aspectRatio:aspectRatio,
        show:true,
        x1:x1,y1:y1,x2:x2,y2:y2,
        handles: true,
        fadeSpeed:200,
        resizeable:true,
        maxHeight:maxHeight,
        maxWidth:maxWidth,
        minHeight:minHeight,
        minWidth:minWidth,
        persistent:true,
        onSelectChange: preview
      });

  }
}

function preview(img, selection) {
    if (!selection.width || !selection.height)
        return;
    $('#preview').css({'width':selection.width+'px','height':selection.height+'px'});
    selWidth=selection.width;
    selHeight=selection.height;
    $('#preview img').css({'left':'-'+selection.x1+'px','top':'-'+selection.y1+'px'});
}