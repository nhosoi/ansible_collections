from __future__ import absolute_import, division, print_function

__metaclass__ = type

from ansible.plugins.callback.default import CallbackModule as CallbackModule_default
from ansible.module_utils._text import to_text
import os
import subprocess


class CallbackModule(CallbackModule_default):
    """
    This callback module brings suddenly death.
    """

    CALLBACK_VERSION = 2.0
    CALLBACK_TYPE = "stdout"
    CALLBACK_NAME = "echo-sd"
    CALLBACK_NEEDS_WHITELIST = True

    b_ECHO_SD_PATHS = (b"/usr/local/bin/echo-sd",)

    def __init__(self):
        super(CallbackModule, self).__init__()

        self.b_echo_sd = None
        self.set_echo_sd_info()

    def set_echo_sd_info(self):
        for b_echo_sd_path in self.b_ECHO_SD_PATHS:
            if os.path.exists(b_echo_sd_path):
                self.b_echo_sd = b_echo_sd_path

    def print_echo_sd(self, message):
        runcmd = [self.b_echo_sd]
        runcmd.append(message)
        cmd = subprocess.Popen(runcmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        (out, err) = cmd.communicate()
        self._display.display(u"%s\n" % to_text(out))

    def v2_runner_on_ok(self, result):
        if "msg" in result._result:
            self.print_echo_sd(result._result.pop("msg"))

    v2_runner_on_failed = v2_runner_on_ok
    v2_runner_on_unreachable = v2_runner_on_ok
    v2_runner_on_skipped = v2_runner_on_ok
