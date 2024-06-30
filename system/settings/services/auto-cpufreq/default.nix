{
  services.auto-cpufreq = {
    enable = true;

    settings = {
      charger = {
        governor = "performance";
        energy_performance_preference = "performance";
        turbo = "always";
      };

      battery = {
        governor = "ondemand";
        energy_performance_preference = "power";
        turbo = "never";

        scaling_min_freq = 800000;
        scaling_max_freq = 2500000;

        enable_thresholds = true;
        start_threshold = 20;
        stop_threshold = 80;
        ideapad_laptop_conservation_mode = true;
      };
    };
  };
}
