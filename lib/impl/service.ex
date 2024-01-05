defmodule CleaningBusinessModel.Impl.Service do
  use Ecto.Schema
  import Ecto.Changeset
  # alias CleaningBusinessModel.Impl.Company

  schema "services" do
    field :title, :string
    field :description, :string
    field :price, :decimal
    field :room, :string
    field :level, :string
    field :company_id, :integer

  end

  def changeset(params \\%{}) do
    %__MODULE__{}
    |> cast(params, [:title, :description, :price, :room, :level, :company_id])
    |> validate_required([:title, :company_id])
    |> apply_changes()
  end

  def new(%{title: _title, description: _description, price: _price}=service) do
    changeset(service)
  end

  def changeset_before_applying() do
    %__MODULE__{}
     |> cast(%{}, [])
  end

end
