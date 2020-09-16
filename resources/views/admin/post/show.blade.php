@extends('layouts.backend.app')

@section('pagestyles')
    <!-- Multi Select Css -->
    <link href="{{asset('assets/backend/plugins/bootstrap-select/css/bootstrap-select.css')}} " rel="stylesheet">

@endsection

@section('content')
        <div class="container-fluid">

            <a href="{{ url()->previous() }}" class="btn btn-danger wave-effect">Back</a>

            @if($post->is_approved==1)
            <button type="button" class="btn btn-danger pull-right" onclick="post_approval();">
                <i class="material-icons">done</i>
                <span>Disapprove</span>
            </button>
            @else
            <button type="button" class="btn btn-success pull-right" onclick="post_approval();">
                <i class="material-icons">done</i>
                <span>Approve</span>
            </button>

            @endif

            <form id="approval-form" action="{{route('admin.post.approval', $post->id)}} " method="post" style="display: none;">
                @csrf
                @method('PUT')
            </form>

            <br><br>
            <!-- <div class="block-header">
                <h2>FORM EXAMPLES</h2>
            </div> -->

            
            <!-- Vertical Layout | With Floating Label -->
            <div class="row clearfix">
                @if(session('success'))
                <div class="col-md-12">
                    <div class="alert bg-green alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        {{ session('success') }}
                    </div>
                </div>
                @endif
                
                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                {{$post->title}}
                                <small>Posted by: <strong>{{Auth::user()->name}}</strong> on {{$post->created_at->toFormattedDateString()}}</small>
                            </h2>

                        </div>
                        <div class="body">                            
                            {!!$post->body!!}
                        </div>
                    </div>
                </div>

                <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header bg-cyan">
                            <h2>
                                Categories 
                                <!-- <small>With floating label</small> -->
                            </h2>

                        </div>
                        <div class="body">                           
                        @foreach($post->categories as $category)
                        <span class="label bg-teal">{{$category->name}}</span>
                        @endforeach
                            
                        </div>
                    </div><!-- Categories -->


                    <div class="card">
                        <div class="header bg-cyan">
                            <h2>
                                Tags 
                                <!-- <small>With floating label</small> -->
                            </h2>

                        </div>
                        <div class="body">                           
                        @foreach($post->tags as $tag)
                        <span class="label bg-teal">{{$tag->name}}</span>
                        @endforeach
                            
                        </div>
                    </div><!-- Tags -->

                    <div class="card">
                        <div class="header bg-cyan">
                            <h2>
                                Featured Image 
                                <!-- <small>With floating label</small> -->
                            </h2>

                        </div>
                        <div class="body">  
                            <!-- <img class="img-responsive thumbnail" src="{{Storage::url('post/'.$post->image)}}" alt=""> -->
                            <img class="img-responsive thumbnail" src="{{asset('storage/post/'.$post->image)}}" alt="">
                            
                        </div>
                    </div><!-- Featured image -->

                </div>
            </div>
            <!-- Vertical Layout | With Floating Label -->




        </div>
@endsection

@section('pagescript')

    <!-- TinyMCE -->
    <script src="{{ asset('assets/backend/plugins/tinymce/tinymce.js')}}"></script>

    <!-- Custom Js -->
    <script src="{{ asset('assets/backend/js/admin.js')}}"></script>
    
    <script type="text/javascript">
$(function () {

        //TinyMCE
        tinymce.init({
            selector: "textarea#tinymce",
            theme: "modern",
            height: 300,
            plugins: [
                'advlist autolink lists link image charmap print preview hr anchor pagebreak',
                'searchreplace wordcount visualblocks visualchars code fullscreen',
                'insertdatetime media nonbreaking save table contextmenu directionality',
                'emoticons template paste textcolor colorpicker textpattern imagetools'
            ],
            toolbar1: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
            toolbar2: 'print preview media | forecolor backcolor emoticons',
            image_advtab: true
        });
        tinymce.suffix = ".min";
        tinyMCE.baseURL = "{{asset('assets/backend/plugins/tinymce') }}";
    });


function post_approval(){
    // document.getElementById('approval-form').submit();
            swal({
              title: "Are you sure to change this?",
              // text: "Once deleted, you will not be able to recover this imaginary file!",
              icon: "warning",
              buttons: true,
              dangerMode: true,
            })
            .then((willDelete) => {
              if (willDelete) {
                document.getElementById('approval-form').submit();
              } 
            });
}

    </script>
@endsection