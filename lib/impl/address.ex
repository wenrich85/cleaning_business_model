defmodule CleaningBusinessModel.Impl.Address do
  use Ecto.Schema

  schema "addresses" do
    field :street, :string
    field :street2, :string
    field :city, :string
    field :state, :string
    belongs_to :home, CleaningBusinessModel.Impl.Home
  end
end
