
//code for edit profile button 

$(document).ready(function () {

    let editStatus = false;
    $('#edit-profile-botton').click(function () {

        if (!editStatus) {
            $('#profile-details').hide();

            $('#profie-edit').show();
            $(this).text("Back");
            editStatus = true;
        } else {
            $('#profile-details').show();

            $('#profie-edit').hide();
            $(this).text("edit");
            editStatus = false;
        }


    });
});

//Edit ends here

//Pic upload

var loadFile = function (event) {
    var image = document.getElementById("output");
    image.src = URL.createObjectURL(event.target.files[0]);
};

//Pic upload ends here

//Add Post js

$(document).ready(function (e) {

//this code will be called when form is submitted
    $("#add-post-form").on("submit", function (event) {
        event.preventDefault();
        let f = new FormData(this);

        $.ajax({
            //url of servlet it is submiting request
            url: "AddPostServlet",
            //data that is inside our form
            data: f,
            //what is the type of request
            type: 'POST',
            success: function (data, textStatus, jqXHR) {

                if (data.trim() === 'Done') {
                    swal(
                            'Good job!',
                            'Saved SuccessFully',
                            'success'
                            );
                    $('#add-post-form')[0].reset();
                } else {
                    swal(
                            'Error!',
                            'Something went wrong. Please tryt again...',
                            'error'
                            );
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {

                swal(
                        'Error!',
                        'Something went wrong. Please tryt again...',
                        'error'
                        );

            },
            processData: false,
            contentType: false


        })


    })
})

//add post js ends here


//Loading posts starts here

function getPosts(catId, temp) {

    $("#loader").show();
    $("#post-container").hide();
    
    $(".c-link").removeClass('active');

    $.ajax({
        url: "load_post.jsp",
        data: {cid: catId},

        success: function (data, textStatus, jqXHR) {
            $("#loader").hide();
            $("#post-container").show();
            $("#post-container").html(data);
            
            $(temp).addClass('active');
        }
    })

}

$(document).ready(function (e) {
    
    let allPostRef = $(".c-link")[0];
    getPosts(0, allPostRef);

})

//Loading posts ends here


function doLike(pid, uid) {
    
    const d = {
        uid: uid,
        pid:pid,
        operation: 'like'
    }
    
    $.ajax({
        url: "likeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            if(data.trim()=='true'){
                let c = $(".like-counter").html();
                c++;
                $(".like-counter").html(c);
            }
            
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(error);
        }
    })
    
}

