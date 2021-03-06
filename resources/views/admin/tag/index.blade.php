@extends('layouts.backend.app')

@section('pagestyles')
@endsection


@section('content')

        <div class="container-fluid">
            <div class="block-header">
                <a href="{{ route('admin.tag.create')}}" class="btn btn-primary">Create Tag</a> <br>

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
                                All Tags 
                                <label class="badge bg-info">{{$tags->count()}} </label>
                                
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
                                        <th>Tag Name</th>
                                        <th>Tag Slug</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($tags as $tag)
                                    <tr>
                                        <th scope="row">{{$tag->id}}</th>
                                        <td>{{$tag->name}}</td>
                                        <td>{{$tag->slug}}</td>
                                        <td>
                                            <a href="{{ route('admin.tag.edit',$tag->id)}} " class="btn btn-primary">Edit</a>
                                            <a href="#" class="btn btn-danger" onclick="delete_tag('{{ $tag->id}}');">Delete</a>
                                            <form id="tag-delete-{{$tag->id}}" action="{{route('admin.tag.destroy', $tag->id)}}" method="post" style="display: none;">
                                                @csrf
                                                @method('DELETE')
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

            function delete_tag(id){
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
                document.getElementById('tag-delete-'+ id).submit();
              } 
            });
            }

        </script>
@endsection
