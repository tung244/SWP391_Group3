package model;

public class UserProfile {

    public Account account;
    public String fullname;
    public String address;
    public String dob;
    public String gender;
    public Rank rank;
    public String image_profile_user;
    public Checkout checkout;
    
    public UserProfile() {
    }

    public Checkout getCheckout() {
        return checkout;
    }

    public void setCheckout(Checkout checkout) {
        this.checkout = checkout;
    }

    public UserProfile(Account account, String fullname, String address, String dob, String gender, Rank rank, String image_profile_user) {
        this.account = account;
        this.fullname = fullname;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
        this.rank = rank;
        this.image_profile_user = image_profile_user;
    }

    public UserProfile(Account account) {
        this.account = account;
    }

    public UserProfile(Account account, String fullname) {
        this.account = account;
        this.fullname = fullname;
    }

    public UserProfile(Account account, String fullname, String address) {
        this.account = account;
        this.fullname = fullname;
        this.address = address;
    }

    public UserProfile(Account account, String fullname, String address, String dob, String gender, String image_profile_user,Rank rank) {
        this.account = account;
        this.fullname = fullname;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
        this.image_profile_user = image_profile_user;
        this.rank = rank;
    }

    public UserProfile(Account account, String fullname, String address, String dob, String gender, String image_profile_user) {
        this.account = account;
        this.fullname = fullname;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
        this.image_profile_user = image_profile_user;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getImage_profile_user() {
        return image_profile_user;
    }

    public void setImage_profile_user(String image_profile_user) {
        this.image_profile_user = image_profile_user;
    }

    public Rank getRank() {
        return rank;
    }

    public void setRank(Rank rank) {
        this.rank = rank;
    }

    @Override
    public String toString() {
        return "UserProfile{" + "account=" + account + ", fullname=" + fullname + ", address=" + address + ", dob=" + dob + ", gender=" + gender + ", rank=" + rank + ", image_profile_user=" + image_profile_user + '}';
    }

}
