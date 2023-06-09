defmodule Api.AccountsTest do
  use Api.DataCase

  alias Api.Accounts

  describe "admins" do
    alias Api.Accounts.Admin

    import Api.AccountsFixtures

    @invalid_attrs %{email: nil, name: nil, password_hash: nil}

    test "list_admins/0 returns all admins" do
      admin = admin_fixture()
      assert Accounts.list_admins() == [admin]
    end

    test "get_admin!/1 returns the admin with given id" do
      admin = admin_fixture()
      assert Accounts.get_admin!(admin.id) == admin
    end

    test "create_admin/1 with valid data creates a admin" do
      valid_attrs = %{email: "some email", name: "some name", password_hash: "some password_hash"}

      assert {:ok, %Admin{} = admin} = Accounts.create_admin(valid_attrs)
      assert admin.email == "some email"
      assert admin.name == "some name"
      assert admin.password_hash == "some password_hash"
    end

    test "create_admin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_admin(@invalid_attrs)
    end

    test "update_admin/2 with valid data updates the admin" do
      admin = admin_fixture()
      update_attrs = %{email: "some updated email", name: "some updated name", password_hash: "some updated password_hash"}

      assert {:ok, %Admin{} = admin} = Accounts.update_admin(admin, update_attrs)
      assert admin.email == "some updated email"
      assert admin.name == "some updated name"
      assert admin.password_hash == "some updated password_hash"
    end

    test "update_admin/2 with invalid data returns error changeset" do
      admin = admin_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_admin(admin, @invalid_attrs)
      assert admin == Accounts.get_admin!(admin.id)
    end

    test "delete_admin/1 deletes the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{}} = Accounts.delete_admin(admin)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_admin!(admin.id) end
    end

    test "change_admin/1 returns a admin changeset" do
      admin = admin_fixture()
      assert %Ecto.Changeset{} = Accounts.change_admin(admin)
    end
  end
end
