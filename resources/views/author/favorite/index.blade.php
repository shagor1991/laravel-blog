@extends('layouts.backend.app')

@section('pagestyles')
@endsection


@section('content')

        <div class="container-fluid">
            <div class="block-header">
                {{-- <a href="{{ route('admin.post.create')}}" class="btn btn-primary">Create Post</a> <br> --}}

                <div class="clearfix">

                </div>
            </div>

            <!-- Hover Rows -->
            <div class="row clearfix">

                @if(session('success'))
                <div class="col-md-12">
                    <div class="alert bg-green alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        {{ session('success') }}
                    </div>
                </div>
                @endif

                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                All Favorite Posts 
                                <label class="badge bg-info">{{$posts->count()}} </label>
                                
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">Action</a></li>
                                        <li><a href="javascript:void(0);">Another action</a></li>
                                        <li><a href="javascript:void(0);">Something else here</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="body table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Title</th>
                                        <th>Author</th>
                                        <th><i class="material-icons">visibility</i></th>
                                        <th><i class="material-icons">favorite</i></th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($posts as $post)
                                    <tr>
                                        <th scope="row">{{$post->id}}</th>
                                        <td>{{ str_limit($post->title,15)}}</td>
                                        <td>{{$post->user->name}}</td>
                                        <td>{{$post->view_count}}</td>
                                        <td>{{$post->favorite_to_users->count()}}</td>
                                        

                                        <td>
                                            <a href="{{ route('author.favorite.show',$post->id)}} " class="btn btn-primary">Show</a>
                                            <a href="#" class="btn btn-danger" onclick="delete_post('{{ $post->id}}');">Remove</a>
                                            <form id="post-remove-{{$post->id}}" action="{{route('author.favorite.remove', $post->id)}}" method="post" style="display: none;">
                                                @csrf
                                                @method('PUT')
                                            </form>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Hover Rows -->



        </div>




@endsection


@section('pagescript')
    <!-- Custom Js -->
    <script src="{{ asset('assets/backend/js/admin.js') }}"></script>
    
        <script type="text/javascript">

            function delete_post(id){
                // alert('Alhamdulillah');
            swal({
              title: "Are you sure to remove this from favorite list?",
              // text: "Once deleted, you will not be able to recover this imaginary file!",
              icon: "warning",
              buttons: true,
              dangerMode: true,
            })
            .then((willDelete) => {
              if (willDelete) {
                document.getElementById('post-remove-'+ id).submit();
              } 
            });
            }

        </script>
@endsection
