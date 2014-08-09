/* Based on form inputs value,
   change submit button and input-field status.
*/
function changeFormStatus(element, status){
  if(status){
    $("#submitBtn").removeAttr("disabled");
    $(element).parent().removeClass('has-error').addClass('has-success');
    $(element).next().removeClass('glyphicon-remove').addClass('glyphicon-ok');
  }else{
    $("#submitBtn").attr("disabled", "disabled");
    $(element).parent().removeClass('has-success').addClass('has-error');
    $(element).next().removeClass('glyphicon-ok').addClass('glyphicon-remove');
  }
}

/* Mobile validation for input.
*/
function mobileValidation(element_id){
  $('#'+element_id).keyup(function(){
    var mobile_format =  /^1[3,4,5,8][0-9]{9}$/;
    var mobile = $(this).val();
    changeFormStatus(this, (mobile.length == 11 && mobile_format.test(mobile)));
  });
}

/* Email validation for input.
*/
function emailValidation(element_id){
  $('#'+element_id).keyup(function(){
    var email_format =  /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;
    var email = $(this).val();
    changeFormStatus(this, email_format.test(email));
  });
}

/* Password validation for input.
*/
function passwordValidation(element_id){
  $('#'+element_id).keyup(function(){
    var password_format =  /\w{6,16}$/;
    var password = $(this).val();
    changeFormStatus(this, (password.length >= 6 && password.length <= 16 && password_format.test(password)));
  });
}

/* Time down counter
*/
var counter = 59;
function countDown(){
  $("#sendCaptcha").html('重新获取('+counter+')');
  counter --;
  if(counter < 0){
    $("#sendCaptcha").removeAttr("disabled").html('立即获取');
  }else{
    setTimeout(countDown, 1000);
  }
}