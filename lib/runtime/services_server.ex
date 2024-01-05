defmodule CleaningBusinessModel.Runtime.ServicesServer do
  use GenServer

  alias CleaningBusinessModel.Impl.Service

  def start_link({company_id, company_name}) do
    IO.puts("Starting the Services Server")
    GenServer.start_link(__MODULE__, company_id, name: via_tuple(company_name))
  end

  def init(company_id) do
    {:ok, %{services: [], count: 1, company_id: company_id}}
  end

  def handle_call({:add_service, service},_from, state) do
    service =
      Map.put(service, :company_id, state.company_id)
      |> Map.put(:id, state.count)
      |> Service.changeset()
    new_state = Map.put(state, :services, [service | state.services])
    |> Map.put(:count, state.count + 1 )
    {:reply, service, new_state}
  end

  def handle_call({:get_services, company_id}, _from, state) do
    services_list = Enum.filter(state.services, fn (service) -> service.company_id == company_id end)
    {:reply, services_list, state}
  end

  def handle_call({:get_services_by_room, room}, _from, state) do
    room_services = Enum.filter(state.services, fn (service) -> service.room == room end)
    {:reply, room_services, state}
  end

  defp via_tuple(id) do
    CleaningBusinessModel.Runtime.BusinessRegistry.via_tuple({__MODULE__, id})
  end

end
