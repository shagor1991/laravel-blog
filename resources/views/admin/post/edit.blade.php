@extends('layouts.backend.app')

@section('pagestyles')
    <!-- Multi Select Css -->
    <link href="{{asset('assets/backend/plugins/bootstrap-select/css/bootstrap-select.css')}} " rel="stylesheet">

@endsection

@section('content')
        <div class="container-fluid">
            <div class="block-header">
                <h2>FORM EXAMPLES</h2>
            </div>

            <form action="{{route('admin.post.update',$post->id)}}" method="post" enctype="multipart/form-data">
                @csrf
                @method('PUT')
            <!-- Vertical Layout | With Floating Label -->
            <div class="row clearfix">
                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Update post
                                <!-- <small>With floating label</small> -->
                            </h2>

                        </div>
                        <div class="body">
                            
                                <div class="form-group form-float">
                                    <div class="form-line {{ $errors->has('title')?'focused error' : ''}} ">
                                        <input type="text" id="title" name="title" class="form-control" value="{{$post->title}}">
                                        <label class="form-label">Post Title</label>
                                    </div>
                                </div>

                                <div class="form-group form-float">
                                    
                                    <input type="file" name="image" class="form-control">
                                    <label class="image">Featured Image</label>
                                    
                                </div>

                                <input type="checkbox" name="status" id="remember_me_2" class="filled-in" value="1" {{$post->status==1 ? 'checked' : ''}}>
                                <label for="remember_me_2">Publish</label>
                                
                                <p><br><br></p>
                            
                        </div>
                    </div>
                </div>

                <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Categories & Tags
                                <!-- <small>With floating label</small> -->
                            </h2>

                        </div>
                        <div class="body">
                            
                                <div class="form-group form-float">
                                    <div class="form-line {{ $errors->has('categories')?'focused error' : ''}}">
                                        <label for="category">Select Category</label>
                                        <select name="categories[]" class="form-control show-tick" id="category" data-live-search="true" multiple>
                                            @foreach($categories as $category)
                                                

                                            <option @foreach($post->categories as $post_category)
                                                {{ $category->id==$post_category->id ? 'selected' : ''}}
                                                @endforeach value="{{$category->id}}">{{$category->name}}</option>

                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group form-float">
                                    <div class="form-line {{ $errors->has('tags')?'focused error' : ''}}">
                                        <label for="tag">Select Tags</label>
                                        <select name="tags[]" class="form-control show-tick" id="tag" data-live-search="true" multiple>
                                            @foreach($tags as $tag)
                                            <option
                                            @foreach($post->tags as $post_tag)
                                            {{$post_tag->id==$tag->id ? 'selected' : ''}}
                                            @endforeach

                                             value="{{$tag->id}}">{{$tag->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>


                                    <a href="{{route('admin.category.index')}}" class="btn btn-danger m-t-15 waves-effect">Back</a>
                                    <button type="submit" class="btn btn-info m-t-15 waves-effect">Submit</button>
                            
                        </div>
                    </div>
                </div>
            </div>
            <!-- Vertical Layout | With Floating Label -->


            <!-- Post Body -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Post Body
                                <!-- <small>With floating label</small> -->
                            </h2>

                        </div>
                        <disv class="body">
                            <textarea id="tinymce" name="body">
                                {{$post->body}}
                            </textarea>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Post Body -->
            </form>

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
    </script>
@endsection