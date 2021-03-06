@extends('backend.backendMaster')
@section('title', 'Bkash Create')
@section('page_title', 'Bkash Create')
@section('page_content')
    <!-- Page -->
    <div class="page">

        <div class="page-header">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="">Home</a></li>
                <li class="breadcrumb-item active">@yield('page_title')</li>
            </ol>
        </div>

        <div class="page-content container-fluid">
            <div class="row">
                <div class="col-md-12">

                    <div class="panel panel-bordered panel-info border border-info">

                        <div class="panel-heading">
                            <h3 class="panel-title">@yield('page_title')</h3>
                        </div>

                        <div class="p-2">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="p-5">
                                        <form action="{{ route('bkash_store') }}" method="POST" id="exampleFullForm" autocomplete="off">
                                            @csrf

                                            <div class="row row-lg">
                                                <div class="col-xl-6 form-horizontal">
                                                    <div class="form-group">
                                                        <div class="input-group input-group-icon">
                                                            <div class="input-group-prepend">
                                                                <div class="input-group-text">
                                                                    Bkash Number
                                                                    <span class="required text-danger"> *</span>
                                                                </div>
                                                            </div>
                                                            <input type="text" name="bkashNumber" class="form-control" required placeholder="Bkash number">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="row row-lg">
                                                <div class="col-xl-6 form-horizontal">
                                                    <div class="form-group">
                                                        <div class="input-group input-group-icon">
                                                            <div class="input-group-prepend">
                                                                <div class="input-group-text">
                                                                    Payment Type
                                                                    <span class="required text-danger"> *</span>
                                                                </div>
                                                            </div>
                                                            <select required="" id="paymentMethodType" name="paymentMethodType" class="form-control">
                                                                <option value=""> Select method </option>
                                                                <option value="1">Bkash</option>
                                                                <option value="2">Nagad</option>
                                                                <option value="3">Rocket</option>
                                                                <option value="4">Paypal</option>
                                                                <option value="5">Stripe</option>
                                                                <option value="6">Neteller</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="row row-lg">
                                                <div class="form-group col-xl-2 padding-top-m">
                                                    <button type="submit" class="btn btn-info" id="validateButton1">Add Number</button>
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- End Page -->

@endsection

@section('page_styles')
    @include('backend.partials._styles')
    @include('backend.partials._formvalidation_style')
@endsection


@section('page_scripts')
    @include('backend.partials._scripts')
    @include('backend.partials._formvalidation_script')
    <script src="{{ asset('/validation/bkashValidation.js') }}"></script>
    <script type="text/javascript">
        $('#configManage').addClass('active open');
        $('#bkashManageChildLi').addClass('active');
    </script>
@endsection
