@extends('layouts.backend.app')

@section('pagestyles')
@endsection


@section('content')

        <div class="container-fluid">

            <!-- Tabs With Icon Title -->
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
                                TABS WITH ICON TITLE
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
                        <div class="body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active">
                                    <a href="#home_with_icon_title" data-toggle="tab">
                                        <i class="material-icons">home</i> Update Profile
                                    </a>
                                </li>
                                <li role="presentation">
                                    <a href="#profile_with_icon_title" data-toggle="tab">
                                        <i class="material-icons">face</i> Change Password
                                    </a>
                                </li>

                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade in active" id="home_with_icon_title">


                            <form class="form-horizontal" action="{{ route('author.settings.update')}}" method="post" enctype="multipart/form-data">
                                @csrf
                                @method('PUT')

                                <div class="row clearfix">
                                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                                        <label for="name">Name</label>
                                    </div>
                                    <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" id="name" value="{{$user->name}}" name="name" class="form-control" placeholder="Name">
                                            </div>
                                            @if($errors->has('name'))
                                            <label id="name-error" class="error" for="name">{{$errors->first('name')}}</label>
                                            @endif
                                        </div>
                                    </div>
                                </div>

                                <div class="row clearfix">
                                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                                        <label for="name">Email</label>
                                    </div>
                                    <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" id="email" value="{{$user->email}}" name="email" class="form-control" placeholder="Email">
                                            </div>
                                            @if($errors->has('email'))
                                            <label id="name-error" class="error" for="email">{{$errors->first('email')}}</label>
                                            @endif
                                        </div>
                                    </div>
                                </div>

                                <div class="row clearfix">
                                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                                        <label for="name">Profile Picture</label>
                                    </div>
                                    <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="file" id="image" name="image" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row clearfix">
                                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                                        <label for="name">About Me</label>
                                    </div>
                                    <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                                        <div class="form-group">
                                            <div class="form-line">
                                                {{-- <input type="file" id="image" name="image" class="form-control"> --}}
                                                <textarea name="about" id="about" class="form-control" cols="30" rows="10">{{$user->about}}</textarea>
                                            </div>
                                            @if($errors->has('about'))
                                            <label id="name-error" class="error" for="name">{{$errors->first('about')}}</label>
                                            @endif
                                        </div>
                                    </div>
                                </div>


                                <div class="row clearfix">
                                    <div class="col-lg-offset-2 col-md-offset-2 col-sm-offset-4 col-xs-offset-5">
                                        <button type="submit" class="btn btn-primary m-t-15 waves-effect">Update Profile</button>
                                    </div>
                                </div>
                            </form>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="profile_with_icon_title">
                                        <form class="form-horizontal" action="{{ route('author.password.update')}}" method="post">
                                            @csrf
                                            @method('PUT')
            
                                            <div class="row clearfix">
                                                <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                                                    <label for="old_password">Old Password</label>
                                                </div>
                                                <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                                                    <div class="form-group">
                                                        <div class="form-line">
                                                            <input type="password" id="old_password" name="old_password" class="form-control" placeholder="Old Password">
                                                        </div>
                                                        @if($errors->has('old_password'))
                                                        <label id="name-error" class="error" for="old_password">{{$errors->first('old_password')}}</label>
                                                        @endif
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row clearfix">
                                                <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                                                    <label for="password">New Password</label>
                                                </div>
                                                <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                                                    <div class="form-group">
                                                        <div class="form-line">
                                                            <input type="password" id="password" name="password" class="form-control" placeholder="New Password">
                                                        </div>
                                                        @if($errors->has('password'))
                                                        <label id="name-error" class="error" for="password">{{$errors->first('password')}}</label>
                                                        @endif
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row clearfix">
                                                <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                                                    <label for="password_confirmation">Confirm Password</label>
                                                </div>
                                                <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                                                    <div class="form-group">
                                                        <div class="form-line">
                                                            <input type="password" id="password_confirmation" name="password_confirmation" class="form-control" placeholder="Confirm Password">
                                                        </div>
                                                        @if($errors->has('password_confirmation'))
                                                        <label id="name-error" class="error" for="password_confirmation">{{$errors->first('password_confirmation')}}</label>
                                                        @endif
                                                    </div>
                                                </div>
                                            </div>
            

            
            
                                            <div class="row clearfix">
                                                <div class="col-lg-offset-2 col-md-offset-2 col-sm-offset-4 col-xs-offset-5">
                                                    <button type="submit" class="btn btn-primary m-t-15 waves-effect">Change Password</button>
                                                </div>
                                            </div>
                                        </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Tabs With Icon Title -->


        </div>




@endsection


@section('pagescript')
    <!-- Custom Js -->
    <script src="{{ asset('assets/backend/js/admin.js') }}"></script>
    <script src="{{ asset('assets/js/pages/index.js') }}"></script>
@endsection
