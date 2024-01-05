defmodule CleaningBusinessModel.Runtime.BusinessServer do
  use GenServer

  alias CleaningBusinessModel.Impl.Company

  # brand new company never started
  def start_link(company) do
    GenServer.start_link(__MODULE__, company, name: via_tuple(company.title))
  end



  def init(%{start_date: start_date}=company) when is_nil(start_date)do
    company_with_start_date = Map.put(company, :start_date, Timex.now("America/Chicago"))
    {:ok, Company.new(company_with_start_date)}
  end

  def init(company) do
    {:ok, Company.new(company)}
  end

  # def handle_call({:add_service service}, _from, company){
  #   new_service =
  # }

  def handle_call(:get_state, _from, company) do
    {:reply, company, company}
  end

  defp via_tuple(id) do
    CleaningBusinessModel.Runtime.BusinessRegistry.via_tuple({__MODULE__, id})
  end
end
