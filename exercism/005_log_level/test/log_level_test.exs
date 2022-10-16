defmodule LogLevelTest do
  use ExUnit.Case

  describe "to_label/2" do
    test "when the logs are supported by legacy, returns the log type" do
      debug_legacy = LogLevel.to_label(1, true)
      info_legacy = LogLevel.to_label(2, true)
      warning_legacy = LogLevel.to_label(3, true)
      error_legacy = LogLevel.to_label(4, true)

      debug = LogLevel.to_label(1, false)
      info = LogLevel.to_label(2, false)
      warning = LogLevel.to_label(3, false)
      error = LogLevel.to_label(4, false)

      assert Enum.all?([debug, debug_legacy], &(&1 == :debug))
      assert Enum.all?([info, info_legacy], &(&1 == :info))
      assert Enum.all?([warning, warning_legacy], &(&1 == :warning))
      assert Enum.all?([error, error_legacy], &(&1 == :error))
    end

    test "when the logs aren't supported by legacy, returns the log type " do
      trace_legacy = LogLevel.to_label(0, true)
      fatal_legacy = LogLevel.to_label(5, true)

      trace = LogLevel.to_label(0, false)
      fatal = LogLevel.to_label(5, false)

      assert trace_legacy == :unknown
      assert fatal_legacy == :unknown

      assert trace == :trace
      assert fatal == :fatal
    end

    test "returns :unknown when the level is unknown" do
      unknown = LogLevel.to_label(10, true)

      unknown_legacy = LogLevel.to_label(10, false)

      assert unknown == :unknown
      assert unknown_legacy == :unknown
    end
  end

  describe "alert_recipient/2" do
    test "alerts ops team" do
      assert LogLevel.alert_recipient(4, true) == :ops
      assert LogLevel.alert_recipient(5, false) == :ops
    end

    test "alerts dev1 team" do
      assert LogLevel.alert_recipient(10, true) == :dev1
      assert LogLevel.alert_recipient(0, true) == :dev1
      assert LogLevel.alert_recipient(5, true) == :dev1
    end

    test "alerts dev2 team" do
      assert LogLevel.alert_recipient(10, false) == :dev2
    end
  end
end
