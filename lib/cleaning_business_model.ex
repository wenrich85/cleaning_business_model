defmodule CleaningBusinessModel do
  alias __MODULE__.Runtime.{BusinessRegistry, ServicesServer, BusinessServer}

  @services_server {ServicesServer, "Felicia's Cleaners"}
  @business_server {BusinessServer, "Felicia's Cleaners"}

  def get_business() do
    GenServer.call(BusinessRegistry.via_tuple(@business_server), :get_state)
  end

  def get_services() do
    GenServer.call(BusinessRegistry.via_tuple(@services_server), {:get_services, 1})
  end

  def get_services_by_room(room) do
    GenServer.call(BusinessRegistry.via_tuple(@services_server), {:get_services_by_room, room})
  end

  def add_service(service) do
    GenServer.call(BusinessRegistry.via_tuple(@services_server), {:add_service, service})
  end
  def delete_service(service) do
    GenServer.call(BusinessRegistry.via_tuple(@services_server), {:delete_service, service})
  end
  def update_service(service, updates) do
    GenServer.call(BusinessRegistry.via_tuple(@services_server), {:update_service, service, updates})
  end
  def add_room(room) do
    GenServer.call(BusinessRegistry.via_tuple(@business_server), {:add_room, room})
  end
end
