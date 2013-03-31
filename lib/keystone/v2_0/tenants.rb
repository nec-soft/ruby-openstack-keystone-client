require 'openstack-client/base'

module Keystone
  module V2_0
  end
end

class Keystone::V2_0::Tenant < Openstack::Client::Resource
  def initialize manager, info, loaded=nil
    super
  end
end

class Keystone::V2_0::TenantManager < Openstack::Client::Manager
  RESOURCE_CLASS = Keystone::V2_0::Tenant

  def initialize api
    super
  end

  def get tenant
    self._get("/tenants/#{get_id(tenant)}", 'tenant')
  end

  def list limit=nil, marker=nil
    params = {}
    params['limit']   = limit   if limit
    params['marker']  = marker  if marker

    self._list(url_with_params("/tenants", params), 'tenants')
  end

end
