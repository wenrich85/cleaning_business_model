defmodule CleaningBusinessModel.Runtime.BusinessRegistry do
  @name __MODULE__
  def start_link do
    IO.puts("Starting #{@name}")
    Registry.start_link(keys: :unique, name: __MODULE__)
  end

  @spec via_tuple(any) :: {:via, Registry, {CleaningBusinessModel.Runtime.BusinessRegistry, any}}
  def via_tuple(key) do
    {:via, Registry, {@name, key}}
  end

  def child_spec(_) do
    Supervisor.child_spec(
      Registry,
      id: __MODULE__,
      start: {__MODULE__, :start_link, []}
    )
  end
end
