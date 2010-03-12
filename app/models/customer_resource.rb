require 'rest_client'
require 'xml-object'

class CustomerResource
  def initialize
    @resource = RestClient::Resource.new('https://inscripcion.mercadolibre.com/jms/mla/api-customers/customers/', 
                                        {:cookies => {'ml_api_key' => 'ASDFIADFMADSOFMASDFMABNQUWENDQWINDASDMLAMFADS' }})
  end

  def get id
    XMLObject.new @resource[id].get
  end

end
