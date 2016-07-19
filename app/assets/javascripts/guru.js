$(document).ready(function(){ 


  $(document).delegate('.sg','click',function(event){
    var id = $(this).attr("id")
    $.ajax({
      method : 'GET',
      url:  '/people/'+id+'/' ,
      data: { "person" : {"first_name": $("#first_name").val() , "last_name": $("#last_name").val()} },
      dataType: "json"
    }).done(function(result){
       console.log(result);
       $("#l").before("<P>"+result.person.first_name+"</p><p>"+result.person.last_name+"<p>");
       $("#l").hide();
    })
  })
  
  $(document).delegate('.button','click',function(event){
    var id = $(this).attr("id")
    $.ajax({
      method : 'DELETE',
      url:  '/people/'+id+'/' ,
      data: { "name": "guru" },
      dataType: "json"
    }).done(function(){
      $("#"+id).parent().parent().fadeOut();
    })
  })


  $(".actions").click(function(){
    var id = $(this).attr("id");
    alert(id);
    $.ajax({
      method : 'POST',
      url:  '/people',
      data: { "person" : {"first_name": $("#first_name").val() , "last_name": $("#last_name").val()} },
      dataType: "json"
    }).done(function(res){
      console.log(res);
      var htmlStr = "<tr><td>"+ res.person.first_name+"</td><td> "+res.person.last_name+"</td>";
      htmlStr += "<td><a href= '#' class='sg' id="+res.person.id+">Show</a>";
      htmlStr += "</td><td><a href='/people/"+res.person.id+"'>Edit</a>";
      htmlStr += "</td><td><a href='#' class='button' id="+res.person.id+">Destroy</a>";
      $("#g").append(htmlStr);
    })
  })


})