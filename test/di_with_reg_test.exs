defmodule DIWithRegTest do
  use ExUnit.Case

  setup do
    {:ok, client} = UseStore.start_link(%{})

    {:ok, client: client}
  end

  test "should show mock store", %{client: client} do
    {:ok, _} = start_supervised({MockStore, nil})

    values = UseStore.work(client)

    assert %{key: MockStore} in values
  end

  test "should not show the mock store", %{client: client} do
    values = UseStore.work(client)

    refute %{key: MockStore} in values
  end

end
