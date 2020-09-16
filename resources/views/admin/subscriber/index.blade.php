@extends('layouts.backend.app')

@section('pagestyles')
@endsection


@section('content')

        <div class="container-fluid">
            <div class="block-header">
                <!-- <a href="{{ route('admin.tag.create')}}" class="btn btn-primary">Create Tag</a> <br> -->

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
                                All Subscriber 
                                <label class="badge bg-info">{{$subscribers->count()}} </label>
                                
                            </h2>

                        </div>
                        <div class="body table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Email</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($subscribers as $subscriber)
                                    <tr>
                                        <th scope="row">{{$subscriber->id}}</th>
                                        <td>{{$subscriber->email}}</td>
                                        <td>
                                            
                                            <a href="#" class="btn btn-danger" onclick="delete_tag('{{ $subscriber->id}}');">Delete</a>
                                            <form id="subscriber-delete-{{$subscriber->id}}" action="{{route('admin.subscriber.destroy', $subscriber->id)}}" method="post" style="display: none;">
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
                document.getElementById('subscriber-delete-'+ id).submit();
              } 
            });
            }

        </script>
@endsection
