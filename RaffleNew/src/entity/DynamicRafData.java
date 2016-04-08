package entity;

public class DynamicRafData {
	private int raffle_no;
	private String organizer_name;
	private int raffle_count;
	private String start_date;
	private String end_date;
	private double min_price;

	public DynamicRafData(int raffle_no, String organizer_name, int raffle_count, String start_date, String end_date,
			double min_price) {
		super();
		this.raffle_no = raffle_no;
		this.organizer_name = organizer_name;
		this.raffle_count = raffle_count;
		this.start_date = start_date;
		this.end_date = end_date;
		this.min_price = min_price;
	}

	public DynamicRafData() {

	}

	public int getRaffle_no() {
		return raffle_no;
	}

	public void setRaffle_no(int raffle_no) {
		this.raffle_no = raffle_no;
	}

	public String getOrganizer_name() {
		return organizer_name;
	}

	public void setOrganizer_name(String organizer_name) {
		this.organizer_name = organizer_name;
	}

	public int getRaffle_count() {
		return raffle_count;
	}

	public void setRaffle_count(int raffle_count) {
		this.raffle_count = raffle_count;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public double getMin_price() {
		return min_price;
	}

	public void setMin_price(double min_price) {
		this.min_price = min_price;
	}

}
