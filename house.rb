class House
    def door
        "自動ドア"
    end
    def step
        "階段"
    end
    def parts
        "名前: #{door},名前: #{step}"
    end
end
@house = House.new

puts House.new.parts