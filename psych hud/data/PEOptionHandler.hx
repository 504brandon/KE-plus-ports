import OptionsMenu;
import KadeEngineData;

function create() {
    if (OptionsMenu.instance != null)
        OptionsMenu.instance.options[0].addOption(new CustomOption("Psych Engine UI", "Psych Engine UI Off", "PEUI", "Makes your game look like psych engine.", true));

    trace(KadeEngineData.KEOptions.get("PEUI"));
}