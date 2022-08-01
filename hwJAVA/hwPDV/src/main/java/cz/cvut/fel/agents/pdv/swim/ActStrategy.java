    package cz.cvut.fel.agents.pdv.swim;

import cz.cvut.fel.agents.pdv.dsand.Message;
import cz.cvut.fel.agents.pdv.dsand.Pair;

import java.util.*;

public class ActStrategy {
    //type message:
    // AckMessage ---> send message from process
    // PingMessage ---> send a message to a process
    // PingMessageReq ---> send a message to some process
    static class AckMessage extends Message{
        private final String processID;
        AckMessage(String processID){
            this.processID = processID;
        }
        public String getAckMessageProcessID(){
            return processID;
        }
    }

    static class PingMessage extends Message{
        private final String processID;
        PingMessage(String processID){
            this.processID = processID;
        }
        public String getPingMessageProcessID(){
            return processID;
        }
    }

    static class PingMessageReq extends Message{
        private final String processID;
        PingMessageReq(String processID){
            this.processID = processID;
        }
        public String getPingMessageReqProcessID(){
            return processID;
        }
    }

    // maximalni zpozdeni zprav
    private final int maxDelayForMessages;
    private final List<String> otherProcesses;

    // Definujte vsechny sve promenne a datove struktury, ktere budete potrebovat
    private final List<String> deadProcess;
    private final HashMap<String, List<String>> pingProcess;
    private final HashMap<String, Integer> pingProcessReq;
    private final int upperBoundOnMessages;
    private static final Random random = new Random();
    private int time;
    private int messageSend;

    public ActStrategy(int maxDelayForMessages, List<String> otherProcesses,
                       int timeToDetectKilledProcess, int upperBoundOnMessages) {
        this.maxDelayForMessages = maxDelayForMessages;
        this.upperBoundOnMessages = upperBoundOnMessages;
        this.otherProcesses = otherProcesses;
        pingProcess = new HashMap<>();
        pingProcessReq = new HashMap<>();
        deadProcess = new ArrayList<>();
        messageSend = 0;
        time = 0;

        // Doplne inicializaci
    }

    /**
     * Metoda je volana s kazdym zavolanim metody act v FailureDetectorProcess. Metodu implementujte
     * tak, jako byste implementovali metodu act() v FailureDetectorProcess, misto pouzivani send()
     * pridejte zpravy v podobe paru - prijemce, zprava do listu. Zpravy budou nasledne odeslany.
     * <p>
     * Diky zavedeni teto metody muzeme kontrolovat pocet odeslanych zprav vasi implementaci.
     */
    public List<Pair<String, Message>> act(Queue<Message> inbox, String disseminationProcess) {
        // Od DisseminationProcess muzete dostat zpravu typu DeadProcessMessage, ktera Vas
        // informuje o spravne detekovanem ukoncenem procesu.
        // DisseminationProcess muzete poslat zpravu o detekovanem "mrtvem" procesu.
        // Zprava musi byt typu PFDMessage.

        LinkedList<Pair<String, Message>> result = new LinkedList<>();

        //check inbox and clear
        checkInbox(result, inbox);

        //TIMEOUT ---> detect died process
        checkDiedProcessAndTimeout(result, disseminationProcess);

        // vybirame randomny process a pingneme tento process
        chooseRandomlyProcess(result);

        time++;
        return result;
    }

    public void checkInbox(LinkedList<Pair<String, Message>> result, Queue<Message> inbox){
        while(!inbox.isEmpty()) {
            Message message = inbox.poll();

            //ACK PROCESS
            if (message instanceof AckMessage  && !deadProcess.contains(message.sender) &&
                    !deadProcess.contains(((AckMessage) message).getAckMessageProcessID())) {
                if(pingProcess.containsKey(((AckMessage) message).getAckMessageProcessID())){
                    for(String process : pingProcess.get(((AckMessage) message).getAckMessageProcessID())){
                        if(upperBoundOnMessages - messageSend > 0){
                            result.add(new Pair<>(process,  message));
                            messageSend++;
                        }
                    }
                    pingProcess.remove(((AckMessage) message).getAckMessageProcessID());
                }
                pingProcessReq.remove(((AckMessage) message).getAckMessageProcessID());
            }

            //PING PROCESS
            if (message instanceof PingMessage ) {
                if (upperBoundOnMessages - messageSend > 0 && !deadProcess.contains(message.sender)) {
                    result.add(new Pair<>(((PingMessage) message).sender, new AckMessage(((PingMessage) message).getPingMessageProcessID())));
                    messageSend++;
                }
            }

            //DEAD PROCESS
            if(message instanceof DeadProcessMessage) {
                otherProcesses.remove(((DeadProcessMessage) message).getProcessID());
                deadProcess.add(((DeadProcessMessage) message).getProcessID());
            }

            //PING REQ PROCESS
            if (message instanceof PingMessageReq && !deadProcess.contains(message.recipient)) {
                pingProcess.put(((PingMessageReq) message).getPingMessageReqProcessID(), new ArrayList<>());
                pingProcess.get(((PingMessageReq) message).getPingMessageReqProcessID()).add(((PingMessageReq) message).sender);
                if(upperBoundOnMessages - messageSend > 0) {
                    result.add(new Pair<>(((PingMessageReq) message).getPingMessageReqProcessID(),
                            new PingMessage (((PingMessageReq) message).getPingMessageReqProcessID())));
                    messageSend++;
                }
            }
        }
    }

    public void checkDiedProcessAndTimeout(LinkedList<Pair<String, Message>> result, String disseminationProcess){
        for (String processPing : pingProcessReq.keySet()) {

            if(pingProcessReq.get(processPing) + 6 * maxDelayForMessages < time && !deadProcess.contains(processPing)
                    && otherProcesses.contains(processPing)) {
                otherProcesses.remove(processPing);
                deadProcess.add(processPing);

                if (upperBoundOnMessages - messageSend > 0) {
                    result.add(new Pair<>(disseminationProcess, new PFDMessage(processPing)));
                    messageSend++;
                }
            }else if (pingProcessReq.get(processPing) + 3 * maxDelayForMessages == time){

                for(int i = 0; i < 10; i++){
                    String randomProcess = otherProcesses.get(random.nextInt(otherProcesses.size()));
                    if(upperBoundOnMessages - messageSend > 0) {
                        result.add(new Pair<>(randomProcess, new PingMessageReq(processPing)));
                        messageSend++;
                    }
                }
            }
        }
    }

    public void chooseRandomlyProcess(LinkedList<Pair<String, Message>> result){

        if(upperBoundOnMessages - messageSend > 0 ) {
            String randomProcess = otherProcesses.get(random.nextInt(otherProcesses.size()));
            result.add(new Pair<>(randomProcess, new PingMessage(randomProcess)));
            messageSend++;
            pingProcessReq.put(randomProcess, time);
        }
    }
}
