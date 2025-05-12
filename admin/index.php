<?php
require_once '../Util.php';
// session_start();

// // Simple authentication
// if(!isset($_SESSION['admin_logged_in'])) {
//     header('Location: login.php');
//     exit;
// }

$util = new Util();
$pdo = $util->getConnection();

// Handle Agent Registration
if($_SERVER['REQUEST_METHOD'] == 'POST') {
    if(isset($_POST['register_agent'])) {
        $agentCode = $_POST['agent_code'];
        $phone = $_POST['phone'];
        $fullName = $_POST['full_name'];
        $pin = $_POST['pin'];

        try {
            $stmt = $pdo->prepare("
                INSERT INTO agents 
                (agent_code, phone_number, full_name, pin_hash, approved, balance)
                VALUES (?, ?, ?, ?, 1, 0)
            ");
            $stmt->execute([
                $agentCode,
                $phone,
                $fullName,
                Util::hashPin($pin)
            ]);
            $success = "Agent registered successfully!";
        } catch(PDOException $e) {
            $error = "Registration failed: " . $e->getMessage();
        }
    }
    
    // Handle transaction cancellation
    if(isset($_POST['cancel_transaction'])) {
        $reference = $_POST['reference'];
        $reason = $_POST['reason'] ?? 'Cancelled by admin';
        
        try {
            $stmt = $pdo->prepare("
                UPDATE transactions 
                SET status = 'failed', 
                    fee = 0,
                    notes = ?
                WHERE reference = ? AND status = 'pending'
            ");
            $stmt->execute([$reason, $reference]);
            $success = "Transaction #$reference cancelled successfully";
        } catch(PDOException $e) {
            $error = "Cancellation failed: " . $e->getMessage();
        }
    }
}

// Get pending withdrawals
$pendingWithdrawals = $pdo->query("
    SELECT t.*, u.full_name as user_name 
    FROM transactions t
    JOIN users u ON t.user_phone = u.phone_number
    WHERE t.type = 'withdraw' AND t.status = 'pending'
    ORDER BY t.created_at DESC
")->fetchAll();

// Get all agents
$agents = $pdo->query("
    SELECT * FROM agents 
    ORDER BY created_at DESC
")->fetchAll();

// Get all transactions
$transactions = $pdo->query("
    SELECT t.*, 
           u.full_name as user_name,
           a.full_name as agent_name
    FROM transactions t
    LEFT JOIN users u ON t.user_phone = u.phone_number
    LEFT JOIN agents a ON t.agent_code = a.agent_code
    ORDER BY t.created_at DESC
    LIMIT 100
")->fetchAll();
?>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #f2f2f2; }
        .form-group { margin-bottom: 15px; }
        input, button, select { padding: 8px; }
        .success { color: green; }
        .error { color: red; }
        .status-pending { color: orange; }
        .status-completed { color: green; }
        .status-failed { color: red; }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover {
            color: black;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>Agent Management</h1>
    
    <?php if(isset($success)): ?>
        <p class="success"><?= htmlspecialchars($success) ?></p>
    <?php endif; ?>
    <?php if(isset($error)): ?>
        <p class="error"><?= htmlspecialchars($error) ?></p>
    <?php endif; ?>

    <h2>Register New Agent</h2>
    <form method="POST">
        <div class="form-group">
            <input type="text" name="agent_code" placeholder="Agent Code" required>
        </div>
        <div class="form-group">
            <input type="text" name="phone" placeholder="Phone Number" required>
        </div>
        <div class="form-group">
            <input type="text" name="full_name" placeholder="Full Name" required>
        </div>
        <div class="form-group">
            <input type="password" name="pin" placeholder="4-digit PIN" required>
        </div>
        <button type="submit" name="register_agent">Register Agent</button>
    </form>

    <h2>Pending Withdrawals</h2>
    <table>
        <tr>
            <th>Reference</th>
            <th>User</th>
            <th>Phone</th>
            <th>Amount</th>
            <th>Agent Code</th>
            <th>Date</th>
            <th>Action</th>
        </tr>
        <?php foreach($pendingWithdrawals as $tx): ?>
        <tr>
            <td><?= htmlspecialchars($tx['reference']) ?></td>
            <td><?= htmlspecialchars($tx['user_name']) ?></td>
            <td><?= htmlspecialchars($tx['user_phone']) ?></td>
            <td><?= Util::formatAmount($tx['amount']) ?></td>
            <td><?= htmlspecialchars($tx['agent_code']) ?></td>
            <td><?= htmlspecialchars($tx['created_at']) ?></td>
            <td>
                <button onclick="openCancelModal('<?= $tx['reference'] ?>')">Cancel</button>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>

    <h2>All Transactions</h2>
    <table>
        <tr>
            <th>Reference</th>
            <th>Type</th>
            <th>User</th>
            <th>Agent</th>
            <th>Amount</th>
            <th>Fee</th>
            <th>Status</th>
            <th>Date</th>
            <th>Action</th>
        </tr>
        <?php foreach($transactions as $tx): ?>
        <tr>
            <td><?= htmlspecialchars($tx['reference']) ?></td>
            <td><?= htmlspecialchars($tx['type']) ?></td>
            <td><?= htmlspecialchars($tx['user_name'] ?? $tx['user_phone']) ?></td>
            <td><?= htmlspecialchars($tx['agent_name'] ?? $tx['agent_code']) ?></td>
            <td><?= Util::formatAmount($tx['amount']) ?></td>
            <td><?= Util::formatAmount($tx['fee']) ?></td>
            <td class="status-<?= htmlspecialchars($tx['status']) ?>">
                <?= htmlspecialchars($tx['status']) ?>
            </td>
            <td><?= htmlspecialchars($tx['created_at']) ?></td>
            <td>
                <?php if($tx['status'] == 'pending'): ?>
                    <button onclick="openCancelModal('<?= $tx['reference'] ?>')">Cancel</button>
                <?php endif; ?>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>

    <h2>Registered Agents</h2>
    <table>
        <tr>
            <th>Code</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Balance</th>
            <th>Date Registered</th>
        </tr>
        <?php foreach($agents as $agent): ?>
        <tr>
            <td><?= htmlspecialchars($agent['agent_code']) ?></td>
            <td><?= htmlspecialchars($agent['full_name']) ?></td>
            <td><?= htmlspecialchars($agent['phone_number']) ?></td>
            <td><?= Util::formatAmount($agent['balance']) ?></td>
            <td><?= htmlspecialchars($agent['created_at']) ?></td>
        </tr>
        <?php endforeach; ?>
    </table>

    <!-- Cancel Transaction Modal -->
    <div id="cancelModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeCancelModal()">&times;</span>
            <h3>Cancel Transaction</h3>
            <form method="POST" id="cancelForm">
                <input type="hidden" name="reference" id="cancelReference">
                <div class="form-group">
                    <label>Reason for cancellation:</label>
                    <select name="reason" required>
                        <option value="Suspected fraud">Suspected fraud</option>
                        <option value="Insufficient funds">Insufficient funds</option>
                        <option value="User request">User request</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Additional notes:</label>
                    <textarea name="notes" rows="3" style="width:100%"></textarea>
                </div>
                <button type="submit" name="cancel_transaction">Confirm Cancellation</button>
            </form>
        </div>
    </div>

    <script>
        function openCancelModal(reference) {
            document.getElementById('cancelReference').value = reference;
            document.getElementById('cancelModal').style.display = 'block';
        }

        function closeCancelModal() {
            document.getElementById('cancelModal').style.display = 'none';
        }

        // Close modal when clicking outside
        window.onclick = function(event) {
            const modal = document.getElementById('cancelModal');
            if (event.target == modal) {
                closeCancelModal();
            }
        }
    </script>
</body>
</html>
