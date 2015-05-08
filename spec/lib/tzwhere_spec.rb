describe TZWhere do
  it "can make lookups" do
    expect(TZWhere.lookup(43.18333333, -79.233333)).to eq(ActiveSupport::TimeZone.new("America/Toronto"))
    expect(TZWhere.lookup(41.7599, -87.2079)).to eq(ActiveSupport::TimeZone.new("America/Chicago"))
  end

  it "loads points only on first lookup" do
    TZWhere.lookup(41.7599, -87.2079)
    expect_any_instance_of(TZWhere::Query).not_to receive(:load_points)
    TZWhere.lookup(41.7599, -87.2079)
  end
end
