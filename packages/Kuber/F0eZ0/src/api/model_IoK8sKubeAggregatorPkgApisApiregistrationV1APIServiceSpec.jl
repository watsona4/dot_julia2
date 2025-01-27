# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec <: SwaggerModel
    caBundle::Any # spec type: Union{ Nothing, Vector{UInt8} } # spec name: caBundle
    group::Any # spec type: Union{ Nothing, String } # spec name: group
    groupPriorityMinimum::Any # spec type: Union{ Nothing, Int32 } # spec name: groupPriorityMinimum
    insecureSkipTLSVerify::Any # spec type: Union{ Nothing, Bool } # spec name: insecureSkipTLSVerify
    service::Any # spec type: Union{ Nothing, IoK8sKubeAggregatorPkgApisApiregistrationV1ServiceReference } # spec name: service
    version::Any # spec type: Union{ Nothing, String } # spec name: version
    versionPriority::Any # spec type: Union{ Nothing, Int32 } # spec name: versionPriority

    function IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec(;caBundle=nothing, group=nothing, groupPriorityMinimum=nothing, insecureSkipTLSVerify=nothing, service=nothing, version=nothing, versionPriority=nothing)
        o = new()
        validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec, Symbol("caBundle"), caBundle)
        setfield!(o, Symbol("caBundle"), caBundle)
        validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec, Symbol("group"), group)
        setfield!(o, Symbol("group"), group)
        validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec, Symbol("groupPriorityMinimum"), groupPriorityMinimum)
        setfield!(o, Symbol("groupPriorityMinimum"), groupPriorityMinimum)
        validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec, Symbol("insecureSkipTLSVerify"), insecureSkipTLSVerify)
        setfield!(o, Symbol("insecureSkipTLSVerify"), insecureSkipTLSVerify)
        validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec, Symbol("service"), service)
        setfield!(o, Symbol("service"), service)
        validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec, Symbol("version"), version)
        setfield!(o, Symbol("version"), version)
        validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec, Symbol("versionPriority"), versionPriority)
        setfield!(o, Symbol("versionPriority"), versionPriority)
        o
    end
end # type IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec

const _property_map_IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec = Dict{Symbol,Symbol}(Symbol("caBundle")=>Symbol("caBundle"), Symbol("group")=>Symbol("group"), Symbol("groupPriorityMinimum")=>Symbol("groupPriorityMinimum"), Symbol("insecureSkipTLSVerify")=>Symbol("insecureSkipTLSVerify"), Symbol("service")=>Symbol("service"), Symbol("version")=>Symbol("version"), Symbol("versionPriority")=>Symbol("versionPriority"))
const _property_types_IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec = Dict{Symbol,String}(Symbol("caBundle")=>"Vector{UInt8}", Symbol("group")=>"String", Symbol("groupPriorityMinimum")=>"Int32", Symbol("insecureSkipTLSVerify")=>"Bool", Symbol("service")=>"IoK8sKubeAggregatorPkgApisApiregistrationV1ServiceReference", Symbol("version")=>"String", Symbol("versionPriority")=>"Int32")
Base.propertynames(::Type{ IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec }) = collect(keys(_property_map_IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec))
Swagger.property_type(::Type{ IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec[name]))}
Swagger.field_name(::Type{ IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec }, property_name::Symbol) =  _property_map_IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec[property_name]

function check_required(o::IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec)
    (getproperty(o, Symbol("groupPriorityMinimum")) === nothing) && (return false)
    (getproperty(o, Symbol("service")) === nothing) && (return false)
    (getproperty(o, Symbol("versionPriority")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec }, name::Symbol, val)
    if name === Symbol("caBundle")
    end
end
