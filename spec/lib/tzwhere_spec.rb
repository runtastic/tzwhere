describe TZWhere do
  [
    [51.51002454, -0.11930466, "Europe/London"],       # UK
    [43.18333333, -79.233333, "America/Toronto"],
    [41.7599, -87.2079, "America/Chicago"],
    [48.2442964, 14.23535228, "Europe/Vienna"],        # Austria
    [35.46066995, 100.45898438, "Asia/Shanghai"],      # China
    [28.88315961, 80.38696289, "Asia/Kathmandu"],      # Nepal
    [-8.0374734, -42.28637695, "America/Fortaleza"],   # Brazil
    [-19.1451682, 46.49414063, "Indian/Antananarivo"], # Madagascar
    [19.74602424, -155.46203613, "Pacific/Honolulu"],  # Hawaii
    [-21.20745873, -175.17219543, "Pacific/Tongatapu"] # Tonga
  ].each do |latitude, longitude, time_zone|
    it "can make lookups in #{time_zone}" do
      expect(TZWhere.lookup(latitude, longitude)).to eq(ActiveSupport::TimeZone.new(time_zone))
    end
  end

  it "loads points only on first lookup" do
    TZWhere.lookup(41.7599, -87.2079)
    expect_any_instance_of(TZWhere::Query).not_to receive(:load_points)
    TZWhere.lookup(41.7599, -87.2079)
  end
end
