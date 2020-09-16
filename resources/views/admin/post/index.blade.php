@extends('layouts.backend.app')

@section('pagestyles')
@endsection


@section('content')

        <div class="container-fluid">
            <div class="block-header">
                <a href="{{ route('admin.post.create')}}" class="btn btn-primary">Create Post</a> <br>

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
                                All Posts 
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
                                        <th>View Count</th>
                                        <th>Status</th>
                                        <th>Is Approve</th>
                                        <th>Created At</th>
                                        <th>Updated At</th>
                                        <th>Action</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($posts as $post)
                                    <tr>
                                        <th scope="row">{{$post->id}}</th>
                                        <td>{{ str_limit($post->title,15)}}</td>
                                        <td>{{$post->user->name}}</td>
                                        <td>{{$post->view_count}}</td>
                                        <td>
                                            @if($post->status==true)
                                            <label class="label label-primary">Published</label>
                                            @else
                                            <label class="label label-danger">Unpublished</label>
                                            @endif
                                        </td>

                                        <td>
                                            @if($post->is_approved==true)
                                            <label class="label label-primary">Approved</label>
                                            @else
                                            <label class="label label-danger">Pending</label>
                                            @endif
                                        </td>
                                        <td>{{$post->created_at}}</td>
                                        <td>{{$post->updated_at}}</td>

                                        <td>
                                            <a href="#" onclick="post_approval({{$post->id}})" class="btn btn-primary">
                                                
                                            {{$post->is_approved==1?'Approve' : 'Disapprove'}}
                                            </a>
                                            <form id="post-approval-{{$post->id}}" action="{{route('admin.post.approval',$post->id)}}" style="display: none;" method="post">
                                                @csrf
                                                @method('PUT')
                                            </form>


                                            <a href="{{ route('admin.post.show',$post->id)}} " class="btn btn-primary">Show</a>
                                            <a href="{{ route('admin.post.edit',$post->id)}} " class="btn btn-primary">Edit</a>
                                            <a href="#" class="btn btn-danger" onclick="delete_post('{{ $post->id}}');">Delete</a>
                                            <form id="post-delete-{{$post->id}}" action="{{route('admin.post.destroy', $post->id)}}" method="post" style="display: none;">
                                                @csrf
                                                @method('DELETE')
                                            </form>
                                        </td>

                                        <td>

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
              title: "Are you sure to delete this?",
              // text: "Once deleted, you will not be able to recover this imaginary file!",
              icon: "warning",
              buttons: true,
              dangerMode: true,
            })
            .then((willDelete) => {
              if (willDelete) {
                document.getElementById('post-delete-'+ id).submit();
              } 
            });
            }


            function post_approval(id){
                // alert('Alhamdulillah');
            swal({
              title: "Are you sure to change this?",
              // text: "Once deleted, you will not be able to recover this imaginary file!",
              icon: "warning",
              buttons: true,
              dangerMode: true,
            })
            .then((willDelete) => {
              if (willDelete) {
                document.getElementById('post-approval-'+ id).submit();
              } 
            });
            }

        </script>
@endsection
