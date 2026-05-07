import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Message {
  final String text;
  final bool isUser;
  final DateTime time;

  Message({
    required this.text,
    required this.isUser,
    required this.time,
  });
}


class Ecobot extends StatefulWidget {
  const Ecobot({super.key});

  @override
  State<Ecobot> createState() => _EcobotState();
}

class _EcobotState extends State<Ecobot> {
  final List<Message> _messages = [];
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  
  bool _isBotTyping = false;

  // Quick reply suggestions
  final List<String> _suggestions = [
    "♻️ How to recycle plastic?",
    "📄 Best way to recycle paper",
    "🔋 Where to dispose batteries?",
    "🥫 Recycling aluminum cans",
  ];

  @override
  void initState() {
    super.initState();
    _addInitialMessages();
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _addInitialMessages() {
    _messages.addAll([
      Message(
        text: "🌿 Hello! I'm EcoBot, your recycling assistant. Ask me how to recycle items like plastic, glass, paper, or batteries!",
        isUser: false,
        time: DateTime.now(),
      ),
      Message(
        text: "💡 You can type your question or tap on the suggestion chips below to get started.",
        isUser: false,
        time: DateTime.now().add(const Duration(seconds: 1)),
      ),
    ]);
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendMessage(String text) async {
    if (text.trim().isEmpty || _isBotTyping) return;

    // Add user message
    setState(() {
      _messages.add(Message(
        text: text.trim(),
        isUser: true,
        time: DateTime.now(),
      ));
      _textController.clear();
      _isBotTyping = true;
    });
    _scrollToBottom();

    // Simulate bot thinking delay
    await Future.delayed(const Duration(milliseconds: 1200));

    // Generate bot response
    final botReply = _generateBotReply(text.trim());
    
    if (mounted) {
      setState(() {
        _isBotTyping = false;
        _messages.add(Message(
          text: botReply,
          isUser: false,
          time: DateTime.now(),
        ));
      });
      _scrollToBottom();
    }
  }
// to be changed
  String _generateBotReply(String userMessage) {
    final lowerMsg = userMessage.toLowerCase();
    
    // Plastic recycling
    if (lowerMsg.contains('plastic')) {
      return "♻️ Plastic recycling: Rinse containers, remove labels, flatten bottles. Check your local for #1 (PETE) and #2 (HDPE). Avoid soft plastics like bags - recycle those at grocery stores!";
    }
    // Paper recycling
    else if (lowerMsg.contains('paper') || lowerMsg.contains('cardboard')) {
      return "📄 Paper recycling: Keep it dry and clean! Remove tape, staples, and windows from envelopes. Flatten cardboard boxes. Shredded paper? Bag it separately.";
    }
    // Battery disposal
    else if (lowerMsg.contains('battery') || lowerMsg.contains('batteries')) {
      return "🔋 Batteries contain hazardous materials. Never toss in trash! Drop off at electronics stores, recycling centers, or municipal hazardous waste events. Use tape on terminals to prevent sparks.";
    }
    // Glass recycling
    else if (lowerMsg.contains('glass')) {
      return "🥃 Glass recycling: Rinse jars/bottles, remove lids (recycle separately). Don't worry about labels. Avoid broken glass, mirrors, or Pyrex - those are different materials!";
    }
    // Aluminum/Cans
    else if (lowerMsg.contains('can') || lowerMsg.contains('aluminum') || lowerMsg.contains('tin')) {
      return "🥫 Aluminum cans are infinitely recyclable! Rinse, crush to save space. Steel/tin cans also recyclable - remove labels if possible. A magnet sticks? It's steel!";
    }
    // E-waste / Electronics
    else if (lowerMsg.contains('electronic') || lowerMsg.contains('computer') || lowerMsg.contains('phone')) {
      return "💻 E-waste contains precious metals & toxins. Never dispose in regular bins! Find certified e-waste recyclers, many stores offer free drop-off for old phones/laptops.";
    }
    // Composting
    else if (lowerMsg.contains('compost') || lowerMsg.contains('food waste')) {
      return "🌱 Composting: Fruit/veg scraps, coffee grounds, eggshells, yard trimmings. Avoid meat, dairy, oils. Balance greens (food) with browns (leaves/paper). Great for garden soil!";
    }
    // General recycling help
    else if (lowerMsg.contains('recycle') && (lowerMsg.contains('how') || lowerMsg.contains('help'))) {
      return "🔄 General recycling tips:\n• Know your local rules (varies!)\n• Empty, Clean, Dry - residue causes contamination\n• When in doubt, check your city's waste website\n• Reduce & Reuse first, then Recycle!";
    }
    // Greeting
    else if (lowerMsg.contains('hi') || lowerMsg.contains('hello') || lowerMsg.contains('hey')) {
      return "👋 Hello there! Ready to make the planet greener? Ask me about recycling plastic, paper, glass, batteries, or electronics!";
    }
    // Default response
    else {
      return "🤔 I'm still learning! Try asking about:\n• Plastic bottles\n• Paper recycling\n• Battery disposal\n• Glass jars\n• Aluminum cans\n• Composting\nWant a specific recycling tip? Please rephrase your question!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Custom Header with EcoBot branding
            Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.recycling,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "EcoBot",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                      Text(
                        "Your recycling assistant",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _messages.clear();
                        _addInitialMessages();
                      });
                      _scrollToBottom();
                    },
                    icon: const Icon(Icons.delete_outline, color: Colors.grey),
                    tooltip: "Clear chat",
                  ),
                ],
              ),
            ),
            
            // Chat Messages Area
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                itemCount: _messages.length + (_isBotTyping ? 1 : 0),
                itemBuilder: (context, index) {
                  // Show typing indicator at the end
                  if (_isBotTyping && index == _messages.length) {
                    return _buildTypingIndicator();
                  }
                  final message = _messages[index];
                  return _buildMessageBubble(message);
                },
              ),
            ),
            
            // Quick Suggestions Chips
            Container(
              margin: const EdgeInsets.only(bottom: 8, top: 4),
              height: 48,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _suggestions.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  return ActionChip(
                    elevation: 0,
                    backgroundColor: Colors.green.shade50,
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    label: Text(
                      _suggestions[index],
                      style: TextStyle(
                        color: Colors.green.shade800,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: _isBotTyping ? null : () => _sendMessage(_suggestions[index]),
                  );
                },
              ),
            ),
            
            // Input Bar
            Container(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 4,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      focusNode: _focusNode,
                      enabled: !_isBotTyping,
                      decoration: const InputDecoration(
                        hintText: "Ask about recycling...",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      onSubmitted: _sendMessage,
                    ),
                  ),
                  const SizedBox(width: 8),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    child: CircleAvatar(
                      backgroundColor: _textController.text.trim().isEmpty || _isBotTyping
                          ? Colors.grey.shade300
                          : Colors.green,
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white, size: 20),
                        onPressed: (_textController.text.trim().isEmpty || _isBotTyping)
                            ? null
                            : () => _sendMessage(_textController.text),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    final isUser = message.isUser;
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: Column(
          crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            // Sender label and time
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!isUser)
                    const Icon(Icons.eco, size: 14, color: Colors.green),
                  if (!isUser)
                    const SizedBox(width: 4),
                  Text(
                    isUser ? "You" : "EcoBot",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: isUser ? Colors.green.shade700 : Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    _formatTime(message.time),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
            // Message bubble
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isUser ? Colors.green.shade500 : Colors.grey.shade100,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: Radius.circular(isUser ? 20 : 4),
                  bottomRight: Radius.circular(isUser ? 4 : 20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: isUser ? Colors.white : Colors.grey.shade800,
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.eco, size: 18, color: Colors.green),
            const SizedBox(width: 8),
            const Text(
              "EcoBot is typing",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(width: 6),
            SizedBox(
              width: 30,
              child: Row(
                children: [
                  _buildDotAnimation(0),
                  _buildDotAnimation(1),
                  _buildDotAnimation(2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDotAnimation(int delay) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 500),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        width: 6,
        height: 6,
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }
}