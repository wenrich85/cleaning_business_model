defmodule CleaningBusinessModel.Runtime.Supervisor do
  alias CleaningBusinessModel.Runtime.BusinessRegistry
  alias CleaningBusinessModel.Runtime.ServicesServer
  alias CleaningBusinessModel.Runtime.BusinessServer
  def start_link() do
    Supervisor.start_link(
      [
        BusinessRegistry,
        {BusinessServer, %{title: "Felicia's Cleaners", start_date: nil}},
        {ServicesServer, { 1, "Felicia's Cleaners"}}
      ],
      strategy: :one_for_one,

      name: SystemSupervisor
    )
  end


end
