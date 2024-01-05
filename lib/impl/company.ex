defmodule CleaningBusinessModel.Impl.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies" do
    field :title, :string
    field :description, :string
    field :mission_statement, :string
    field :ein, :string
    field :insurer, :string
    field :bonder, :string
    field :start_date, :utc_datetime

  end

  def new(params \\ %{}) do
    %__MODULE__{}
     |> cast(params, [:title, :description, :mission_statement, :ein, :insurer, :bonder, :start_date])
     |> validate_required([:title, :start_date])
     |> apply_changes()
  end


end
