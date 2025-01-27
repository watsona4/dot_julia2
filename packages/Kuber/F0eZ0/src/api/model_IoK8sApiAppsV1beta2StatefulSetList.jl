# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sApiAppsV1beta2StatefulSetList <: SwaggerModel
    apiVersion::Any # spec type: Union{ Nothing, String } # spec name: apiVersion
    items::Any # spec type: Union{ Nothing, Vector{IoK8sApiAppsV1beta2StatefulSet} } # spec name: items
    kind::Any # spec type: Union{ Nothing, String } # spec name: kind
    metadata::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ListMeta } # spec name: metadata

    function IoK8sApiAppsV1beta2StatefulSetList(;apiVersion=nothing, items=nothing, kind=nothing, metadata=nothing)
        o = new()
        validate_property(IoK8sApiAppsV1beta2StatefulSetList, Symbol("apiVersion"), apiVersion)
        setfield!(o, Symbol("apiVersion"), apiVersion)
        validate_property(IoK8sApiAppsV1beta2StatefulSetList, Symbol("items"), items)
        setfield!(o, Symbol("items"), items)
        validate_property(IoK8sApiAppsV1beta2StatefulSetList, Symbol("kind"), kind)
        setfield!(o, Symbol("kind"), kind)
        validate_property(IoK8sApiAppsV1beta2StatefulSetList, Symbol("metadata"), metadata)
        setfield!(o, Symbol("metadata"), metadata)
        o
    end
end # type IoK8sApiAppsV1beta2StatefulSetList

const _property_map_IoK8sApiAppsV1beta2StatefulSetList = Dict{Symbol,Symbol}(Symbol("apiVersion")=>Symbol("apiVersion"), Symbol("items")=>Symbol("items"), Symbol("kind")=>Symbol("kind"), Symbol("metadata")=>Symbol("metadata"))
const _property_types_IoK8sApiAppsV1beta2StatefulSetList = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("items")=>"Vector{IoK8sApiAppsV1beta2StatefulSet}", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ListMeta")
Base.propertynames(::Type{ IoK8sApiAppsV1beta2StatefulSetList }) = collect(keys(_property_map_IoK8sApiAppsV1beta2StatefulSetList))
Swagger.property_type(::Type{ IoK8sApiAppsV1beta2StatefulSetList }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sApiAppsV1beta2StatefulSetList[name]))}
Swagger.field_name(::Type{ IoK8sApiAppsV1beta2StatefulSetList }, property_name::Symbol) =  _property_map_IoK8sApiAppsV1beta2StatefulSetList[property_name]

function check_required(o::IoK8sApiAppsV1beta2StatefulSetList)
    (getproperty(o, Symbol("items")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiAppsV1beta2StatefulSetList }, name::Symbol, val)
end
