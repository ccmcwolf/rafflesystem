package entity;

public class Raffle {

	private int raffle_id;
	private int raffle_no;
	private String is_exists;
	private double buy_price;
	private RaffleCampaign campaign;

	public String getIs_exists() {
		return is_exists;
	}

	public void setIs_exists(String is_exists) {
		this.is_exists = is_exists;
	}

	public Raffle() {

	}

	public int getRaffle_id() {
		return raffle_id;
	}

	public void setRaffle_id(int raffle_id) {
		this.raffle_id = raffle_id;
	}

	public int getRaffle_no() {
		return raffle_no;
	}

	public void setRaffle_no(int raffle_no) {
		this.raffle_no = raffle_no;
	}

	public double getBuy_price() {
		return buy_price;
	}

	public void setBuy_price(double buy_price) {
		this.buy_price = buy_price;
	}

	public RaffleCampaign getCampaign() {
		return campaign;
	}

	public void setCampaign(RaffleCampaign campaign) {
		this.campaign = campaign;
	}

}
